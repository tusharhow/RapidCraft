import 'package:flutter/material.dart';

mixin PaddingMixin<T> {
  T addPadding(EdgeInsetsGeometry padding);

  T get hp4 => addPadding(const EdgeInsets.symmetric(horizontal: 4));
  T get hp6 => addPadding(const EdgeInsets.symmetric(horizontal: 6));
  T get hp8 => addPadding(const EdgeInsets.symmetric(horizontal: 8));
  T get hp10 => addPadding(const EdgeInsets.symmetric(horizontal: 10));
  T get hp12 => addPadding(const EdgeInsets.symmetric(horizontal: 12));
  T get hp14 => addPadding(const EdgeInsets.symmetric(horizontal: 14));
  T get hp16 => addPadding(const EdgeInsets.symmetric(horizontal: 16));
  T get hp18 => addPadding(const EdgeInsets.symmetric(horizontal: 18));
  T get hp20 => addPadding(const EdgeInsets.symmetric(horizontal: 20));
  T get hp22 => addPadding(const EdgeInsets.symmetric(horizontal: 22));
  T get hp24 => addPadding(const EdgeInsets.symmetric(horizontal: 24));
  T get hp26 => addPadding(const EdgeInsets.symmetric(horizontal: 26));
  T get hp30 => addPadding(const EdgeInsets.symmetric(horizontal: 30));
  T get hp36 => addPadding(const EdgeInsets.symmetric(horizontal: 36));
  T get hp38 => addPadding(const EdgeInsets.symmetric(horizontal: 38));
  T get hp40 => addPadding(const EdgeInsets.symmetric(horizontal: 40));

  T get vp4 => addPadding(const EdgeInsets.symmetric(vertical: 4));
  T get vp6 => addPadding(const EdgeInsets.symmetric(vertical: 6));
  T get vp8 => addPadding(const EdgeInsets.symmetric(vertical: 8));
  T get vp10 => addPadding(const EdgeInsets.symmetric(vertical: 10));
  T get vp12 => addPadding(const EdgeInsets.symmetric(vertical: 12));
  T get vp14 => addPadding(const EdgeInsets.symmetric(vertical: 14));
  T get vp16 => addPadding(const EdgeInsets.symmetric(vertical: 16));
  T get vp18 => addPadding(const EdgeInsets.symmetric(vertical: 18));
  T get vp20 => addPadding(const EdgeInsets.symmetric(vertical: 20));
  T get vp22 => addPadding(const EdgeInsets.symmetric(vertical: 22));
  T get vp24 => addPadding(const EdgeInsets.symmetric(vertical: 24));
  T get vp26 => addPadding(const EdgeInsets.symmetric(vertical: 26));
  T get vp30 => addPadding(const EdgeInsets.symmetric(vertical: 30));
  T get vp36 => addPadding(const EdgeInsets.symmetric(vertical: 36));
  T get vp40 => addPadding(const EdgeInsets.symmetric(vertical: 40));

  T get p4 => addPadding(const EdgeInsets.all(4));
  T get p6 => addPadding(const EdgeInsets.all(6));
  T get p8 => addPadding(const EdgeInsets.all(8));
  T get p10 => addPadding(const EdgeInsets.all(10));
  T get p12 => addPadding(const EdgeInsets.all(12));
  T get p14 => addPadding(const EdgeInsets.all(14));
  T get p16 => addPadding(const EdgeInsets.all(16));
  T get p18 => addPadding(const EdgeInsets.all(18));
  T get p20 => addPadding(const EdgeInsets.all(20));
  T get p22 => addPadding(const EdgeInsets.all(22));
  T get p24 => addPadding(const EdgeInsets.all(24));
  T get p26 => addPadding(const EdgeInsets.all(26));
  T get p30 => addPadding(const EdgeInsets.all(30));
  T get p36 => addPadding(const EdgeInsets.all(36));
  T get p40 => addPadding(const EdgeInsets.all(40));

  T padding({double? left, double? top, double? right, double? bottom}) {
    return addPadding(EdgeInsets.only(
      left: left ?? 0,
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
    ));
  }
}
