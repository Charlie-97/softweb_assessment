import 'package:flutter/material.dart';
import 'app_assets.dart';
import 'app_colors.dart';

class AppTextstyles {
  static const TextStyle bodyRegular = TextStyle(
    fontFamily: aeonikFont,
    color: appWhite,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 20 / 16,
  );

  static TextStyle bodyLight = bodyRegular.copyWith(
    color: appGreyText,
    fontWeight: FontWeight.w300,
    height: 24 / 16,
    letterSpacing: -.002,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: aeonikFont,
    fontSize: 10,
    height: 12 / 10,
    letterSpacing: -.002,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: aeonikFont,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: appWhite,
    letterSpacing: -.002,
    height: 24 / 18,
  );

  static TextStyle hintText =
      bodyRegular.copyWith(color: const Color(0xFFA4A4A4));

  static const authHeader = TextStyle(
    fontFamily: aeonikFont,
    color: appWhite,
    fontSize: 36,
    letterSpacing: -0.002,
    fontWeight: FontWeight.w300,
    height: 44 / 36,
  );

  static TextStyle otp = bodyRegular.copyWith(fontSize: 24);

  static const TextStyle navBarLabel = TextStyle(
    fontFamily: aeonikFont,
    color: appGreyText2,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 24 / 12,
  );

  static TextStyle navBarLabelSelected =
      navBarLabel.copyWith(color: appWhite);

  static const actionButton = TextStyle(
    fontFamily: aeonikFont,
    color: appGreyText3,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 24 / 14,
    letterSpacing: -0.002,
  );
}
