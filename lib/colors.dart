import 'package:flutter/painting.dart';

class AppColors {
  static const Color lightPurple = Color.fromRGBO(237, 231, 255, 1);
  static const Color darkPurple = Color.fromRGBO(138, 101, 255, 1);

  static const Color cyan = Color.fromRGBO(52, 202, 201, 1);
  static const Color red = Color.fromRGBO(255, 97, 77, 1);

  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color transparent = Color.fromRGBO(0, 0, 0, 0);

  static Color lerpGradient(double t) {
    //colors and stops
    const colors = [AppColors.cyan, AppColors.darkPurple, AppColors.red];
    const stops = [0, 0.5, 1];

    for (var s = 0; s < stops.length - 1; s++) {
      final leftStop = stops[s], rightStop = stops[s + 1];
      final leftColor = colors[s], rightColor = colors[s + 1];
      if (t <= leftStop) {
        return leftColor;
      } else if (t < rightStop) {
        final sectionT = (t - leftStop) / (rightStop - leftStop);
        return Color.lerp(leftColor, rightColor, sectionT);
      }
    }
    return colors.last;
  }
}
