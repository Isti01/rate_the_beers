import 'package:flutter/material.dart';

const kAppColor = Color(0xFFFFD02B);
const kColoredFontColor = Color(0xFFFFC700);
const kDividerColor = Color(0xFFE4E4E4);
const kIconColor = Color(0xFF666666);

final kAppBorderRadius = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

final kAppTheme = ThemeData(
  colorSchemeSeed: kAppColor,
  // Google Fonts doesn't include all the needed font weights
  fontFamily: 'Poppins',
);
