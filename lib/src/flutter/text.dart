import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'mixins/rc_color_mixin.dart';
import 'mixins/padding_mixin.dart';

class _TextSegment {
  dynamic content;
  TextStyle style;
  Gradient? gradient;
  VoidCallback? onTap;

  _TextSegment(this.content,
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
    _segments.add(_TextSegment(text, style: const TextStyle(fontSize: 16)));
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

  RcText size(double size) {
    return _updateCurrentSegment((segment) {
      segment.style = segment.style.copyWith(fontSize: size);
    });
  }

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

  RcText radialGradient(
    List<Color> colors, {
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    AlignmentGeometry? focal,
    double focalRadius = 0.0,
    GradientTransform? transform,
  }) {
    return _updateCurrentSegment((segment) {
      segment.gradient = RadialGradient(
        colors: colors,
        center: center,
        radius: radius,
        stops: stops,
        tileMode: tileMode,
        focal: focal,
        focalRadius: focalRadius,
        transform: transform,
      );
      segment.style = segment.style.copyWith(color: null);
    });
  }

  RcText sweepGradient(
    List<Color> colors, {
    AlignmentGeometry center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = math.pi * 2,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) {
    return _updateCurrentSegment((segment) {
      segment.gradient = SweepGradient(
        colors: colors,
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      );
      segment.style = segment.style.copyWith(color: null);
    });
  }

  RcText textSpan(dynamic content) {
    if (content is String) {
      _segments.add(_TextSegment(content));
    } else if (content is Widget) {
      _segments.add(_TextSegment(content));
    } else if (content is RcText) {
      _segments.addAll(content._segments);
    } else {
      _segments.add(_TextSegment(content.toString()));
    }
    return this;
  }

  RcText onTap(VoidCallback callback) {
    return _updateCurrentSegment((segment) => segment.onTap = callback);
  }

  RcText toUpperCase() => _updateCurrentSegment(
      (segment) => segment.content = segment.content.toUpperCase());
  RcText toLowerCase() => _updateCurrentSegment(
      (segment) => segment.content = segment.content.toLowerCase());
  RcText capitalize() => _updateCurrentSegment((segment) =>
      segment.content = StringExtension(segment.content).capitalize());
  RcText trim() => _updateCurrentSegment(
      (segment) => segment.content = segment.content.trim());
  RcText removeSpaces() => _updateCurrentSegment(
      (segment) => segment.content = segment.content.replaceAll(' ', ''));
  RcText removeAllSpaces() => _updateCurrentSegment((segment) =>
      segment.content = StringExtension(segment.content).removeAllSpaces());
  RcText stringLength() => _updateCurrentSegment((segment) => segment.content =
      StringExtension(segment.content).stringLength().toString());
  RcText reverseString() => _updateCurrentSegment((segment) =>
      segment.content = StringExtension(segment.content).reverseString());
  RcText removeVowels() => _updateCurrentSegment((segment) =>
      segment.content = StringExtension(segment.content).removeVowels());
  RcText removeConsonants() => _updateCurrentSegment((segment) =>
      segment.content = StringExtension(segment.content).removeConsonants());
  RcText removeSpecialCharacters() =>
      _updateCurrentSegment((segment) => segment.content =
          StringExtension(segment.content).removeSpecialCharacters());
  RcText removeNumbers() => _updateCurrentSegment((segment) =>
      segment.content = StringExtension(segment.content).removeNumbers());
  RcText removePunctuation() => _updateCurrentSegment((segment) =>
      segment.content = StringExtension(segment.content).removePunctuation());
  RcText removeNonAlphanumeric() =>
      _updateCurrentSegment((segment) => segment.content =
          StringExtension(segment.content).removeNonAlphanumeric());

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

  RcText _textBaselineHidden(TextBaseline baseline) {
    _textBaseline = baseline;
    return this;
  }

  // Getters for baselines
  RcText get alphabetic => _textBaselineHidden(TextBaseline.alphabetic);
  RcText get ideographic => _textBaselineHidden(TextBaseline.ideographic);

  RcText _fontWeighth(FontWeight weight) {
    _fontWeight = weight;
    return this;
  }

  // Getters for common font weights
  RcText get bold => _fontWeighth(FontWeight.bold);
  RcText get normal => _fontWeighth(FontWeight.normal);
  RcText get w100 => _fontWeighth(FontWeight.w100);
  RcText get w200 => _fontWeighth(FontWeight.w200);
  RcText get w300 => _fontWeighth(FontWeight.w300);
  RcText get w400 => _fontWeighth(FontWeight.w400);
  RcText get w500 => _fontWeighth(FontWeight.w500);
  RcText get w600 => _fontWeighth(FontWeight.w600);
  RcText get w700 => _fontWeighth(FontWeight.w700);
  RcText get w800 => _fontWeighth(FontWeight.w800);
  RcText get w900 => _fontWeighth(FontWeight.w900);

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
      if (segment.content is String) {
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
              segment.content as String,
              style: updatedStyle.copyWith(color: Colors.white),
              overflow: _overflow,
              maxLines: _maxLines,
            ),
          );
        } else {
          textWidget = Text(
            segment.content as String,
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
      } else if (segment.content is Widget) {
        return segment.content as Widget;
      } else {
        throw StateError('Invalid segment content type');
      }
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

  // Explicitly define all methods from RcText
  RcText size(double size) => text.size(size);
  RcText color(Color color) => text.color(color);
  RcText get center => text.center;
  RcText linearGradient(
    List<Color> colors, {
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) =>
      text.linearGradient(
        colors,
        begin: begin,
        end: end,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      );

  RcText radialGradient(
    List<Color> colors, {
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    AlignmentGeometry? focal,
    double focalRadius = 0.0,
    GradientTransform? transform,
  }) =>
      text.radialGradient(
        colors,
        center: center,
        radius: radius,
        stops: stops,
        tileMode: tileMode,
        focal: focal,
        focalRadius: focalRadius,
        transform: transform,
      );

  RcText sweepGradient(
    List<Color> colors, {
    AlignmentGeometry center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = math.pi * 2,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) =>
      text.sweepGradient(
        colors,
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      );

  // ------------------ Include all other methods from RcText here

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
  RcText overflow(TextOverflow overflow) => text.overflow(overflow);
  RcText maxLines(int lines) => text.maxLines(lines);
  RcText decorationColor(Color color) => text.decorationColor(color);
  RcText decorationThickness(double thickness) =>
      text.decorationThickness(thickness);
  RcText decorationStyle(TextDecorationStyle style) =>
      text.decorationStyle(style);
  RcText letterSpacing(double spacing) => text.letterSpacing(spacing);
  RcText wordSpacing(double spacing) => text.wordSpacing(spacing);
  RcText height(double height) => text.height(height);
  RcText get alphabetic => text.alphabetic;
  RcText get ideographic => text.ideographic;
  RcText fontWeight(FontWeight weight) => text._fontWeighth(weight);
  RcText fontStyle(FontStyle style) => text.fontStyle(style);
  RcText fontFamily(String family) => text.fontFamily(family);
  RcText get underline => text.underline;
  RcText get overline => text.overline;
  RcText get lineThrough => text.lineThrough;

  // ------------------------Font weight methods
  RcText get bold => text.bold;
  RcText get normal => text.normal;
  RcText get w100 => text.w100;
  RcText get w200 => text.w200;
  RcText get w300 => text.w300;
  RcText get w400 => text.w400;
  RcText get w500 => text.w500;
  RcText get w600 => text.w600;
  RcText get w700 => text.w700;
  RcText get w800 => text.w800;
  RcText get w900 => text.w900;

  RcText textSpan(dynamic content) => text.textSpan(content);

  Widget show() => text.show();
}
