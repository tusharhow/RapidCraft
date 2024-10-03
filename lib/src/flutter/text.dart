import 'package:flutter/material.dart';
import 'mixins/rc_color_mixin.dart';
import 'mixins/padding_mixin.dart';

class _TextSegment {
  String text;
  TextStyle style;
  Gradient? gradient;
  VoidCallback? onTap;

  _TextSegment(this.text,
      {this.style = const TextStyle(), this.gradient, this.onTap});
}

class RcText with RcColorMixin<RcText>, PaddingMixin<RcText> {
  final List<_TextSegment> _segments = [];
  TextAlign? _alignment;
  VoidCallback? _onTap;
  EdgeInsetsGeometry _padding = EdgeInsets.zero;
  TextOverflow? _overflow;
  int? _maxLines;
  TextDecoration _decoration = TextDecoration.none;
  Color? _decorationColor;
  double? _decorationThickness;
  TextDecorationStyle? _decorationStyle;
  double? _letterSpacing;
  double? _wordSpacing;
  double? _height;
  TextBaseline? _textBaseline;
  FontWeight? _fontWeight;
  FontStyle? _fontStyle;
  String? _fontFamily;

  RcText(String text) {
    _segments.add(_TextSegment(text, style: TextStyle(fontSize: 16))); // Default font size
  }

  RcText _updateCurrentSegment(void Function(_TextSegment) update) {
    if (_segments.isNotEmpty) {
      update(_segments.last);
    }
    return this;
  }

  RcText _updateAllSegments(void Function(_TextSegment) update) {
    for (var segment in _segments) {
      update(segment);
    }
    return this;
  }

  @override
  RcText _rcColorCopyWith(Color color) {
    return _updateCurrentSegment((segment) {
      segment.style = segment.style.copyWith(color: color);
      segment.gradient = null;
    });
  }

  @override
  RcText color(Color color) => _rcColorCopyWith(color);

  @override
  RcText addPadding(EdgeInsetsGeometry padding) {
    _padding = _padding.add(padding);
    return this;
  }

  RcText size(double size) => _updateCurrentSegment(
      (segment) => segment.style = segment.style.copyWith(fontSize: size));

  RcText get center {
    _alignment = TextAlign.center;
    return this;
  }

  RcText linearGradient(
    List<Color> colors, {
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) {
    return _updateCurrentSegment((segment) {
      segment.gradient = LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      );
      segment.style = segment.style.copyWith(color: null);
    });
  }

  RcText textSpan(String text) {
    _segments.add(_TextSegment(text));
    return this;
  }

  RcText onTap(VoidCallback callback) {
    return _updateCurrentSegment((segment) => segment.onTap = callback);
  }


  RcText toUpperCase() => _updateCurrentSegment(
      (segment) => segment.text = segment.text.toUpperCase());
  RcText toLowerCase() => _updateCurrentSegment(
      (segment) => segment.text = segment.text.toLowerCase());
  RcText capitalize() => _updateCurrentSegment(
      (segment) => segment.text = StringExtension(segment.text).capitalize());
  RcText trim() =>
      _updateCurrentSegment((segment) => segment.text = segment.text.trim());
  RcText removeSpaces() => _updateCurrentSegment(
      (segment) => segment.text = segment.text.replaceAll(' ', ''));
  RcText removeAllSpaces() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).removeAllSpaces());
  RcText stringLength() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).stringLength().toString());
  RcText reverseString() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).reverseString());
  RcText removeVowels() => _updateCurrentSegment(
      (segment) => segment.text = StringExtension(segment.text).removeVowels());
  RcText removeConsonants() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).removeConsonants());
  RcText removeSpecialCharacters() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).removeSpecialCharacters());
  RcText removeNumbers() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).removeNumbers());
  RcText removePunctuation() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).removePunctuation());
  RcText removeNonAlphanumeric() => _updateCurrentSegment((segment) =>
      segment.text = StringExtension(segment.text).removeNonAlphanumeric());
  
  
  RcText overflow(TextOverflow overflow) {
    _overflow = overflow;
    return this;
  }

  RcText maxLines(int lines) {
    _maxLines = lines;
    return this;
  }


  RcText _decorationHidden(TextDecoration decoration) {
    _decoration = decoration;
    return this;
  }

  RcText decorationColor(Color color) {
    _decorationColor = color;
    return this;
  }

  RcText decorationThickness(double thickness) {
    _decorationThickness = thickness;
    return this;
  }

  RcText decorationStyle(TextDecorationStyle style) {
    _decorationStyle = style;
    return this;
  }

  RcText letterSpacing(double spacing) {
    _letterSpacing = spacing;
    return this;
  }

  RcText wordSpacing(double spacing) {
    _wordSpacing = spacing;
    return this;
  }

  RcText height(double height) {
    _height = height;
    return this;
  }

  RcText textBaseline(TextBaseline baseline) {
    _textBaseline = baseline;
    return this;
  }

  RcText fontWeight(FontWeight weight) {
    _fontWeight = weight;
    return this;
  }

  RcText fontStyle(FontStyle style) {
    _fontStyle = style;
    return this;
  }

  RcText fontFamily(String family) {
    _fontFamily = family;
    return this;
  }

  RcText get underline => _decorationHidden(TextDecoration.underline);
  RcText get overline => _decorationHidden(TextDecoration.overline);
  RcText get lineThrough => _decorationHidden(TextDecoration.lineThrough);

  Widget show() {
    List<Widget> textWidgets = _segments.map((segment) {
      TextStyle updatedStyle = segment.style.copyWith(
        decoration: _decoration,
        decorationColor: _decorationColor,
        decorationThickness: _decorationThickness,
        decorationStyle: _decorationStyle,
        letterSpacing: _letterSpacing,
        wordSpacing: _wordSpacing,
        height: _height,
        textBaseline: _textBaseline,
        fontWeight: _fontWeight,
        fontStyle: _fontStyle,
        fontFamily: _fontFamily,
      );

      Widget textWidget;
      if (segment.gradient != null) {
        textWidget = ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => segment.gradient!.createShader(bounds),
          child: Text(
            segment.text,
            style: updatedStyle.copyWith(color: Colors.white),
            overflow: _overflow,
            maxLines: _maxLines,
          ),
        );
      } else {
        textWidget = Text(
          segment.text,
          style: updatedStyle,
          overflow: _overflow,
          maxLines: _maxLines,
        );
      }

      if (segment.onTap != null) {
        textWidget = GestureDetector(
          onTap: segment.onTap,
          child: textWidget,
        );
      }

      return textWidget;
    }).toList();

    Widget resultWidget = textWidgets.length == 1
        ? textWidgets.first
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: textWidgets,
          );

    if (_alignment != null) {
      resultWidget = Align(
        alignment: _alignment == TextAlign.center
            ? Alignment.center
            : _alignment == TextAlign.left
                ? Alignment.centerLeft
                : Alignment.centerRight,
        child: resultWidget,
      );
    }

    if (_onTap != null) {
      resultWidget = GestureDetector(
        onTap: _onTap,
        child: resultWidget,
      );
    }

    if (_padding != EdgeInsets.zero) {
      resultWidget = Padding(padding: _padding, child: resultWidget);
    }

    return resultWidget;
  }
}

extension RcTextExtensions on String {
  RcText get text => RcText(this);
}

extension WidgetRcTextExtensions on RcText {
  Widget get widget => show();
}

extension StringExtension on String {
  String capitalize() {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  }

  String toUpperCase() {
    return toUpperCase();
  }

  String toLowerCase() {
    return toLowerCase();
  }

  String trim() {
    return trim();
  }

  String removeSpaces() {
    return replaceAll(' ', '');
  }

  String removeAllSpaces() {
    return replaceAll(' ', '');
  }

  int stringLength() {
    return length;
  }

  String reverseString() {
    return split('').reversed.join('');
  }

  String removeVowels() {
    return replaceAll(RegExp(r'[aeiouAEIOU]'), '');
  }

  String removeConsonants() {
    return replaceAll(RegExp(r'[^aeiouAEIOU]'), '');
  }

  String removeSpecialCharacters() {
    return replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  String removeNumbers() {
    return replaceAll(RegExp(r'[0-9]'), '');
  }

  String removePunctuation() {
    return replaceAll(RegExp(r'[^\w\s]'), '');
  }

  String removeNonAlphanumeric() {
    return replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }
}

extension StringRcTextExtension on String {
  RcText get text => RcText(this);

  RcText toUpperCase() => text.toUpperCase();
  RcText toLowerCase() => text.toLowerCase();
  RcText capitalize() => text.capitalize();
  RcText trim() => text.trim();
  RcText removeSpaces() => text.removeSpaces();
  RcText removeAllSpaces() => text.removeAllSpaces();
  RcText stringLength() => text.stringLength();
  RcText reverseString() => text.reverseString();
  RcText removeVowels() => text.removeVowels();
  RcText removeConsonants() => text.removeConsonants();
  RcText removeSpecialCharacters() => text.removeSpecialCharacters();
  RcText removeNumbers() => text.removeNumbers();
  RcText removePunctuation() => text.removePunctuation();
  RcText removeNonAlphanumeric() => text.removeNonAlphanumeric();
  RcText linearGradient(
    List<Color> colors, {
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) =>
      text.linearGradient(colors,
          begin: begin,
          end: end,
          stops: stops,
          tileMode: tileMode,
          transform: transform);

  RcText size(double size) => text.size(size);
  RcText color(Color color) => text.color(color);
  RcText get center => text.center;
  RcText onTap(VoidCallback callback) => (this as RcText).onTap(callback);
  RcText textSpan(String text) => (this as RcText).textSpan(text);
  RcText overflow(TextOverflow overflow) => text.overflow(overflow);
  RcText maxLines(int lines) => text.maxLines(lines);
  RcText decoration(TextDecoration decoration) => text._decorationHidden(decoration);
  RcText decorationColor(Color color) => text.decorationColor(color);
  RcText decorationThickness(double thickness) => text.decorationThickness(thickness);
  RcText decorationStyle(TextDecorationStyle style) => text.decorationStyle(style);
  RcText letterSpacing(double spacing) => text.letterSpacing(spacing);
  RcText wordSpacing(double spacing) => text.wordSpacing(spacing);
  RcText height(double height) => text.height(height);
  RcText textBaseline(TextBaseline baseline) => text.textBaseline(baseline);
  RcText fontWeight(FontWeight weight) => text.fontWeight(weight);
  RcText fontStyle(FontStyle style) => text.fontStyle(style);
  RcText fontFamily(String family) => text.fontFamily(family);
  RcText get underline => text.underline;
  RcText get overline => text.overline;
  RcText get lineThrough => text.lineThrough;
  
  Widget show() => RcText(this).show();
}