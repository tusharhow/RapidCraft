import 'package:flutter/material.dart';
import 'text.dart';
import 'mixins/rc_color_mixin.dart';
import 'mixins/padding_mixin.dart';


class RcBox with RcColorMixin<RcBox>, PaddingMixin<RcBox> {
  Widget? _child;
  double? _width;
  double? _height;
  BoxDecoration _boxDecoration = BoxDecoration();
  DecorationImage? _image;
  EdgeInsetsGeometry _padding = EdgeInsets.zero;

  RcBox child(Widget child) {
    _child = child;
    return this;
  }

  RcBox text(String text) {
    return child(RcText(text).show());
  }

  RcBox width(double width) {
    _width = width;
    return this;
  }

  RcBox height(double height) {
    _height = height;
    return this;
  }

  

  RcBox _backgroundColor(Color color) {
    _boxDecoration = _boxDecoration.copyWith(color: color);
    return this;
  }

  RcBox borderRadius(BorderRadius radius) {
    _boxDecoration = _boxDecoration.copyWith(borderRadius: radius);
    return this;
  }

  RcBox border(BoxBorder border) {
    _boxDecoration = _boxDecoration.copyWith(border: border);
    return this;
  }

  RcBox boxShadow(List<BoxShadow> shadows) {
    _boxDecoration = _boxDecoration.copyWith(boxShadow: shadows);
    return this;
  }

  RcBox gradient(Gradient gradient) {
    _boxDecoration = _boxDecoration.copyWith(gradient: gradient);
    return this;
  }

  RcBox shape(BoxShape shape) {
    _boxDecoration = _boxDecoration.copyWith(shape: shape);
    return this;
  }

  RcBox image(DecorationImage image) {
    _boxDecoration = _boxDecoration.copyWith(image: image);
    return this;
  }

  @override
  RcBox _rcColorCopyWith(Color color) {
    return _backgroundColor(color);
  }

  @override
  RcBox color(Color color) => _rcColorCopyWith(color);

  @override
  RcBox addPadding(EdgeInsetsGeometry padding) {
    _padding = _padding.add(padding);
    return this;
  }

  Widget show() {
    return Container(
      width: _width,
      height: _height,
      padding: _padding,
      decoration: _boxDecoration,
      child: _child,
    );
  }
}

extension StringToRcBox on String {
  RcBox get box => RcBox().text(this);
}



