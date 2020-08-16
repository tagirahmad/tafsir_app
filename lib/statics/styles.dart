// Project imports:
import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/configs/size_config.dart';

final double homeArabicFs = SizeConfig.safeBlockHorizontal * 30;
final double homeHadisFs = SizeConfig.safeBlockHorizontal * 4;
final double continueReadingBtn = SizeConfig.safeBlockHorizontal * 3;
final double toChapters = continueReadingBtn;
final double appBarTitleFs = SizeConfig.safeBlockHorizontal * 4.5;
final double cardChapterFs = SizeConfig.safeBlockHorizontal * 4;
final double cardTitleFs = SizeConfig.safeBlockHorizontal * 4.5;
const double buttonHeight = 40;

final BorderRadius buttonBorderRad = BorderRadius.circular(15.0);

final Shader arabicLinearGradient = const LinearGradient(
  colors: <Color>[
    Color(0xFF9683ec),
    Colors.indigoAccent,
    Color(0xFF7630ff),
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const EdgeInsets zeroPadding = EdgeInsets.all(0.0);
