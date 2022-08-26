import 'package:flutter/material.dart';
import 'package:todo_list_app/style/colors.dart';
import 'package:todo_list_app/style/size.dart';

class TextStyles {
  static const numFollowText = TextStyle(
    color: TypeColors.mainColor,
    fontWeight: FontWeight.w400,
    fontSize: TextSize.tSize18,
  );

  static const sizeNameText = TextStyle(
    color: TypeColors.subTextColor,
    fontWeight: FontWeight.w700,
    fontSize: TextSize.tSize18,
  );
  static const mainFontNameClass = TextStyle(
    fontSize: TextSize.tSize13,
    fontWeight: FontWeight.w400,
    color: TypeColors.subTextColor,
  );

  static const normal = TextStyle(
    color: TypeColors.subTextColor,
    fontWeight: FontWeight.w400,
    fontSize: TextSize.tSize18,
  );

  static const choiceText = TextStyle(
    color: TypeColors.mainTextColor,
    fontWeight: FontWeight.w400,
    fontSize: TextSize.tSize18,
  );

  static const textButton = TextStyle(
    color: TypeColors.subTextColor,
    fontWeight: FontWeight.w400,
    fontSize: TextSize.tSize18,
  );

  static const bigText = TextStyle(
    color: TypeColors.mainTextColor,
    fontWeight: FontWeight.bold,
    fontSize: TextSize.tSize24,
  );

  static const superText = TextStyle(
    color: TypeColors.mainTextColor,
    fontWeight: FontWeight.bold,
    fontSize: TextSize.tSize40,
  );
}
