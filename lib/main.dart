import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_house/colors.dart';

import 'air_conditioner/air_conditioner_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Smart House',
    theme: ThemeData(
      fontFamily: 'Proxima',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AirConditionerView(),
  ));
}
