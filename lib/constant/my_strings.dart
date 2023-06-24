import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

TextStyle textstyle({Color? color, FontWeight? weight, double? size}) {
  return GoogleFonts.poppins(color: color, fontSize: size, fontWeight: weight);
}

TextStyle sondchoose() {
  return TextStyle(color: MyColors.Primary, fontSize: 18.sp);
}

TextStyle sondnotchoose() {
  return TextStyle(color: MyColors.textWhite, fontSize: 18.sp);
}

const apisubah = 'azkar_sabah';
const apimasa = 'azkar_massa';
const apipray = 'PostPrayer_azkar';
