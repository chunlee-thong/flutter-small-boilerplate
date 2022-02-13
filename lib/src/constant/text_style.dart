import 'package:flutter/material.dart';
import 'package:flutter_small_boilerplate/src/utils/logger.dart';
import 'package:sura_flutter/sura_flutter.dart';

import '../providers/loading_overlay_provider.dart';
import 'app_theme_color.dart';

const TextStyle kHeaderStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const TextStyle kSubHeaderStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
const TextStyle kTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const TextStyle kSubtitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
const TextStyle kNormalStyle = TextStyle(
  fontSize: 14,
);
const TextStyle kCaptionStyle = TextStyle(
  fontSize: 12,
);
const TextStyle kOverLineStyle = TextStyle(
  fontSize: 10,
);

extension StyleExtension on TextStyle {
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get red => copyWith(color: Colors.red);
  TextStyle get grey => copyWith(color: Colors.grey);
  TextStyle get green => copyWith(color: Colors.green);
  TextStyle get primary => copyWith(color: AppColor.primary);
  TextStyle get accent => copyWith(color: AppColor.accent);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get responsive => copyWith(fontSize: _responsiveFontSize(fontSize ?? 14));
}

double _responsiveFontSize(double size) {
  double width = LoadingOverlayProvider.context!.screenSize.width;
  infoLog(width);
  if (width > 1024) {
    return size + 6;
  } else if (width > 768) {
    return size + 4;
  }
  return size;
}
