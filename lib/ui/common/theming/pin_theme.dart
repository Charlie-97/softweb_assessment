import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../app_colors.dart';

import '../app_textstyles.dart';

PinTheme defaultPinTheme = PinTheme(
  width: 46,
  height: 52,
  textStyle: AppTextstyles.otp,
  decoration: BoxDecoration(
    color: appBlackShade2,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: appTextFieldGrey, // Choose your desired border color
      width: 1, // Choose the border width
    ),
  ),
);

PinTheme focusedPinTheme = PinTheme(
  width: 46,
  height: 52,
  textStyle: AppTextstyles.otp,
  decoration: BoxDecoration(
    color: appBlackShade2,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
      color: appWhite, // Choose your desired border color
      width: 1.5, // Choose the border width
    ),
  ),
);
