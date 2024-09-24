import 'package:flutter/material.dart';

const String fontFamily = "Prompt";

class AppCustomTextStyle extends TextStyle {
  factory AppCustomTextStyle.title1() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      letterSpacing: 0,
      fontFamilyFallback: [
        fontFamily,
      ],
    );
  }
  factory AppCustomTextStyle.title2() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      letterSpacing: 0,
      fontFamilyFallback: [
        fontFamily,
      ],
    );
  }
  factory AppCustomTextStyle.title3() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0,
      fontFamilyFallback: [
        fontFamily,
      ],
    );
  }
  factory AppCustomTextStyle.title4() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0,
      fontFamilyFallback: [
        fontFamily,
      ],
    );
  }

  factory AppCustomTextStyle.body1() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0,
      fontFamilyFallback: [fontFamily],
    );
  }

  factory AppCustomTextStyle.body2() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      lineHeight: 24,
      letterSpacing: 0,
      fontFamilyFallback: [fontFamily],
    );
  }
  factory AppCustomTextStyle.body3() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      letterSpacing: 0,
      fontFamilyFallback: [fontFamily],
    );
  }
  factory AppCustomTextStyle.body4() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      lineHeight: 16,
      letterSpacing: 0,
      fontFamilyFallback: [
        fontFamily,
      ],
    );
  }
  factory AppCustomTextStyle.body5() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0,
      lineHeight: 16,
      fontFamilyFallback: [
        fontFamily,
      ],
    );
  }

  factory AppCustomTextStyle.buttonUnderline() {
    return const AppCustomTextStyle._(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      lineHeight: 16,
      letterSpacing: 0,
      decoration: TextDecoration.underline,
      fontFamilyFallback: [fontFamily],
    );
  }

  const AppCustomTextStyle._({
    super.fontFamily,
    super.fontWeight,
    required double super.fontSize,
    double? lineHeight,
    super.letterSpacing,
    super.decoration,
    super.fontFamilyFallback,
  }) : super(
          height: lineHeight != null ? lineHeight / fontSize : null,
        );
}
