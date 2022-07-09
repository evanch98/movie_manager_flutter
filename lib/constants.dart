import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* Every constant value for this application can be found in this file. */

const kLogoSize = 126.0;
const kMainScreenTitleIconSize = 30.0;
const kDrawerTitleIconSize = 24.0;

/* The following const values are for MovieData and things depending on
 * MovieData.
*/
// Start --------------------
const kToWatch = 'to watch';
const kWatched = 'watched';
const kFavorite = 'favorite';
// end ----------------------

const kPlatinum = Color(0xFFE6E6E6);
const kRodeoDust = Color(0xFFC5A880);
const kIndianTan = Color(0xFF532E1C);
const kBlack = Color(0xFF0F0F0F);

TextStyle kTitleTextStyle = GoogleFonts.robotoSlab(
  color: kIndianTan,
  fontSize: 30,
  fontWeight: FontWeight.w900,
);

const kButtonTextStyle = TextStyle(
  color: kPlatinum,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kLabelTextStyle = TextStyle(
  color: kIndianTan,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

const kMainScreenTitleTextStyle = TextStyle(
  color: kIndianTan,
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
);

const kGreetingTextStyle = TextStyle(
  color: kIndianTan,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

const kDrawerHeaderTextStyle = TextStyle(
  color: kPlatinum,
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);

const kDrawerTitleTextStyle = TextStyle(
  color: kIndianTan,
  fontSize: 22.0,
);

const kAddImageTextStyle = TextStyle(
  color: kIndianTan,
  fontSize: 16.0,
);

const kHelpParaTextStyle = TextStyle(
  color: kIndianTan,
  height: 1.5,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);
