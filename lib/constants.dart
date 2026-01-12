import 'package:flutter/material.dart';

// Colors
const kTextColor = Color(0xFF707070);
const kTextLightColor = Color(0xFF555555);
const kPrimaryColor = Color(0xFF07E24A);

const kLinkedInColor = Color(0xFFD9FFFC);
const kWhatsAppColor = Color(0xFFE4FFC7);

const kService1Color = Color(0xFFD9FFFC);
const kService2Color = Color(0xFFE4FFC7);
const kService3Color = Color(0xFFFFF3DD);
const kService4Color = Color(0xFFFFE0E0);

const kOutlineBorderColor = Color(0xFFCEE4FD);
const kShadowColor = Color(0xFF0700B1);

const kDefaultPadding = 20.0;
const kFormFieldWidth = 470.0;
const kButtonHorizontalPadding = 8.0;
const kButtonVerticalPadding = 3.0;
const kIconScale = 0.8;
const kContactIconHeight = 40.0;
const kContactIconHeightLoading = 20.0;
const kSectionTitleHeight = 100.0;
const kSectionTitleWidth = 8.0;
const kBottomSpacing = 400.0;

final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: kShadowColor.withAlpha(38),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withAlpha(25),
);

final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

final kDefaultOutlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: kOutlineBorderColor,
  ),
);

const kSectionTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w200, color: kTextColor);
const kButtonTextStyle =
    TextStyle(fontWeight: FontWeight.w600, color: Colors.black);

/// API Configuration should be set up securely using environment variables
/// or a secure configuration system. Do not hardcode sensitive tokens.
/// Example for secure implementation:
/// class ApiConfig {
///   static const String formSubmitUrl = String.fromEnvironment('FORM_URL');
///   static const String formId = String.fromEnvironment('FORM_ID');
///   static const String wpFormsToken = String.fromEnvironment('WPFORMS_TOKEN');
/// }

const String kDefaultReview =
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua enim ad minim veniam.';
