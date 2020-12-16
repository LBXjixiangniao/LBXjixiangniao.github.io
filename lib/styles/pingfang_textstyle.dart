import 'package:flutter/material.dart';

import 'color_helper.dart';

class CustomTextStyle {
   static TextStyle get h1 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorHelper.PrimaryTextColor,
      );
   static TextStyle get h2Bold => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorHelper.PrimaryTextColor,
      );
   static TextStyle get h2 => TextStyle(
        fontSize: 16,
        color: ColorHelper.PrimaryTextColor,
      );

   static TextStyle get bodyBold => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: ColorHelper.PrimaryTextColor,
      );
   static TextStyle get body => TextStyle(
        fontSize: 14,
        color: ColorHelper.PrimaryTextColor,
      );
   static TextStyle get bodyLight => TextStyle(
        fontSize: 14,
        color: ColorHelper.AssistTextColor,
      );

   static TextStyle get summary => TextStyle(
        fontSize: 12,
        color: ColorHelper.PrimaryTextColor,
      );
   static TextStyle get summaryLight => TextStyle(
        fontSize: 12,
        color: ColorHelper.AssistTextColor,
      );

   static TextStyle get caption => TextStyle(
        fontSize: 11,
        color: ColorHelper.PrimaryTextColor,
      );
   static TextStyle get captionLight => TextStyle(
        fontSize: 11,
        color: ColorHelper.AssistTextColor,
      );
}
