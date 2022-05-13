import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryDarkColor = Color(0xff2A2438);
const Color primaryLightColor = Color(0xff352F44);
const Color secondaryDarkColor = Color(0xff5c5470);
const Color secondaryLightColor = Color(0xffdbd8e3);
const Color lightColor = Color(0xffF0F1F6);
const Color buttonColor = Color(0xffE5E5E5);
const Color backgroundColor = Color(0xfffafafa);

const Color bluredBackgroundColor = Color.fromRGBO(42, 36, 56, .9);

const LinearGradient incomeChartGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [chartsLineColor1, chartsLineColor2],
);
const LinearGradient expenseChartGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [chartExpenseLineColor1, chartExpenseLineColor2],
);

const Color chartsLineColor1 = Color.fromARGB(255, 181, 142, 204);
const Color chartsLineColor2 = Color.fromARGB(255, 93, 230, 221);

const Color chartExpenseLineColor1 = Color.fromARGB(255, 226, 23, 23);
const Color chartExpenseLineColor2 = Color.fromARGB(255, 165, 106, 106);

const Color incomeColor = Color(0xff4F75FE);
const Color secondryIncomeColor = Color(0xff82D3E5);
const Color expenseColor = Color(0xffFD635C);
const Color balanceColor = Color(0xff028254);

const Color primaryTextColor = Color(0xffFFFFFF);
const Color secondaryTextColor = Color(0xff000000);

final TextStyle primaryMediumTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w500,
);

final TextStyle secondryMediumTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
  fontWeight: FontWeight.w500,
);

final TextStyle primaryNormalTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w400,
);
final TextStyle secondryNormalTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
  fontWeight: FontWeight.w400,
);
final TextStyle thinNormalTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
  fontWeight: FontWeight.w100,
);

final TextStyle semiThinNormalTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
  fontWeight: FontWeight.w200,
);
final TextStyle primaryThinTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w200,
);

final TextStyle boldTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
  fontWeight: FontWeight.w800,
);
