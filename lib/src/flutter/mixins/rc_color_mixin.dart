import 'package:flutter/material.dart';
import '../constants/rc_colors.dart';

mixin RcColorMixin<T> {
  T _rcColorCopyWith(Color color);
  

  T color(Color color);

  // White
  T get white => color(RcColors.white);
  T get white10 => color(RcColors.white10);
  T get white12 => color(RcColors.white12);
  T get white24 => color(RcColors.white24);
  T get white30 => color(RcColors.white30);
  T get white38 => color(RcColors.white38);
  T get white54 => color(RcColors.white54);
  T get white60 => color(RcColors.white60);
  T get white70 => color(RcColors.white70);

  // Black
  T get black => color(RcColors.black);
  T get black12 => color(RcColors.black12);
  T get black26 => color(RcColors.black26);
  T get black38 => color(RcColors.black38);
  T get black45 => color(RcColors.black45);
  T get black54 => color(RcColors.black54);
  T get black87 => color(RcColors.black87);

  // Gray
  T get gray => color(RcColors.gray);
  T get gray50 => color(RcColors.gray50);
  T get gray100 => color(RcColors.gray100);
  T get gray200 => color(RcColors.gray200);
  T get gray300 => color(RcColors.gray300);
  T get gray400 => color(RcColors.gray400);
  T get gray500 => color(RcColors.gray500);
  T get gray600 => color(RcColors.gray600);
  T get gray700 => color(RcColors.gray700);
  T get gray800 => color(RcColors.gray800);
  T get gray900 => color(RcColors.gray900);

  // Blue
  T get blue => color(RcColors.blue);
  T get blue50 => color(RcColors.blue50);
  T get blue100 => color(RcColors.blue100);
  T get blue200 => color(RcColors.blue200);
  T get blue300 => color(RcColors.blue300);
  T get blue400 => color(RcColors.blue400);
  T get blue500 => color(RcColors.blue500);
  T get blue600 => color(RcColors.blue600);
  T get blue700 => color(RcColors.blue700);
  T get blue800 => color(RcColors.blue800);
  T get blue900 => color(RcColors.blue900);

  // Cyan
  T get cyan => color(RcColors.cyan);
  T get cyan50 => color(RcColors.cyan50);
  T get cyan100 => color(RcColors.cyan100);
  T get cyan200 => color(RcColors.cyan200);
  T get cyan300 => color(RcColors.cyan300);
  T get cyan400 => color(RcColors.cyan400);
  T get cyan500 => color(RcColors.cyan500);
  T get cyan600 => color(RcColors.cyan600);
  T get cyan700 => color(RcColors.cyan700);
  T get cyan800 => color(RcColors.cyan800);
  T get cyan900 => color(RcColors.cyan900);

  // Amber
  T get amber => color(RcColors.amber);
  T get amber50 => color(RcColors.amber50);
  T get amber100 => color(RcColors.amber100);
  T get amber200 => color(RcColors.amber200);
  T get amber300 => color(RcColors.amber300);
  T get amber400 => color(RcColors.amber400);
  T get amber500 => color(RcColors.amber500);
  T get amber600 => color(RcColors.amber600);
  T get amber700 => color(RcColors.amber700);
  T get amber800 => color(RcColors.amber800);
  T get amber900 => color(RcColors.amber900);

  // Pink
  T get pink => color(RcColors.pink);
  T get pink50 => color(RcColors.pink50);
  T get pink100 => color(RcColors.pink100);
  T get pink200 => color(RcColors.pink200);
  T get pink300 => color(RcColors.pink300);
  T get pink400 => color(RcColors.pink400);
  T get pink500 => color(RcColors.pink500);
  T get pink600 => color(RcColors.pink600);
  T get pink700 => color(RcColors.pink700);
  T get pink800 => color(RcColors.pink800);
  T get pink900 => color(RcColors.pink900);

  // Red
  T get red => color(RcColors.red);
  T get red50 => color(RcColors.red50);
  T get red100 => color(RcColors.red100);
  T get red200 => color(RcColors.red200);
  T get red300 => color(RcColors.red300);
  T get red400 => color(RcColors.red400);
  T get red500 => color(RcColors.red500);
  T get red600 => color(RcColors.red600);
  T get red700 => color(RcColors.red700);
  T get red800 => color(RcColors.red800);
  T get red900 => color(RcColors.red900);

  // Orange
  T get orange => color(RcColors.orange);
  T get orange50 => color(RcColors.orange50);
  T get orange100 => color(RcColors.orange100);
  T get orange200 => color(RcColors.orange200);
  T get orange300 => color(RcColors.orange300);
  T get orange400 => color(RcColors.orange400);
  T get orange500 => color(RcColors.orange500);
  T get orange600 => color(RcColors.orange600);
  T get orange700 => color(RcColors.orange700);
  T get orange800 => color(RcColors.orange800);
  T get orange900 => color(RcColors.orange900);

  // Purple
  T get purple => color(RcColors.purple);
  T get purple50 => color(RcColors.purple50);
  T get purple100 => color(RcColors.purple100);
  T get purple200 => color(RcColors.purple200);
  T get purple300 => color(RcColors.purple300);
  T get purple400 => color(RcColors.purple400);
  T get purple500 => color(RcColors.purple500);
  T get purple600 => color(RcColors.purple600);
  T get purple700 => color(RcColors.purple700);
  T get purple800 => color(RcColors.purple800);
  T get purple900 => color(RcColors.purple900);

  // Indigo
  T get indigo => color(RcColors.indigo);
  T get indigo50 => color(RcColors.indigo50);
  T get indigo100 => color(RcColors.indigo100);
  T get indigo200 => color(RcColors.indigo200);
  T get indigo300 => color(RcColors.indigo300);
  T get indigo400 => color(RcColors.indigo400);
  T get indigo500 => color(RcColors.indigo500);
  T get indigo600 => color(RcColors.indigo600);
  T get indigo700 => color(RcColors.indigo700);
  T get indigo800 => color(RcColors.indigo800);
  T get indigo900 => color(RcColors.indigo900);

  // Teal
  T get teal => color(RcColors.teal);
  T get teal50 => color(RcColors.teal50);
  T get teal100 => color(RcColors.teal100);
  T get teal200 => color(RcColors.teal200);
  T get teal300 => color(RcColors.teal300);
  T get teal400 => color(RcColors.teal400);
  T get teal500 => color(RcColors.teal500);
  T get teal600 => color(RcColors.teal600);
  T get teal700 => color(RcColors.teal700);
  T get teal800 => color(RcColors.teal800);
  T get teal900 => color(RcColors.teal900);

  // Green
  T get green => color(RcColors.green);
  T get green50 => color(RcColors.green50);
  T get green100 => color(RcColors.green100);
  T get green200 => color(RcColors.green200);
  T get green300 => color(RcColors.green300);
  T get green400 => color(RcColors.green400);
  T get green500 => color(RcColors.green500);
  T get green600 => color(RcColors.green600);
  T get green700 => color(RcColors.green700);
  T get green800 => color(RcColors.green800);
  T get green900 => color(RcColors.green900);

  // Lime
  T get lime => color(RcColors.lime);
  T get lime50 => color(RcColors.lime50);
  T get lime100 => color(RcColors.lime100);
  T get lime200 => color(RcColors.lime200);
  T get lime300 => color(RcColors.lime300);
  T get lime400 => color(RcColors.lime400);
  T get lime500 => color(RcColors.lime500);
  T get lime600 => color(RcColors.lime600);
  T get lime700 => color(RcColors.lime700);
  T get lime800 => color(RcColors.lime800);
  T get lime900 => color(RcColors.lime900);

  // Yellow
  T get yellow => color(RcColors.yellow);
  T get yellow50 => color(RcColors.yellow50);
  T get yellow100 => color(RcColors.yellow100);
  T get yellow200 => color(RcColors.yellow200);
  T get yellow300 => color(RcColors.yellow300);
  T get yellow400 => color(RcColors.yellow400);
  T get yellow500 => color(RcColors.yellow500);
  T get yellow600 => color(RcColors.yellow600);
  T get yellow700 => color(RcColors.yellow700);
  T get yellow800 => color(RcColors.yellow800);
  T get yellow900 => color(RcColors.yellow900);

  // Brown
  T get brown => color(RcColors.brown);
  T get brown50 => color(RcColors.brown50);
  T get brown100 => color(RcColors.brown100);
  T get brown200 => color(RcColors.brown200);
  T get brown300 => color(RcColors.brown300);
  T get brown400 => color(RcColors.brown400);
  T get brown500 => color(RcColors.brown500);
  T get brown600 => color(RcColors.brown600);
  T get brown700 => color(RcColors.brown700);
  T get brown800 => color(RcColors.brown800);
  T get brown900 => color(RcColors.brown900);

  // Transparent
  T get transparent => color(RcColors.transparent);
}