import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:smart_house/colors.dart';

import 'air_condtioner_widgets/smoke_animated_background.dart';
import 'air_condtioner_widgets/temp_circle_painter.dart';
import 'air_condtioner_widgets/custom_slider.dart' as CustomSlider;

class AirConditionerView extends StatefulWidget {
  @override
  _AirConditionerViewState createState() => _AirConditionerViewState();
}

class _AirConditionerViewState extends State<AirConditionerView> {
  double _temprature = 0.0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SmokeAnimatedBackground(
            currentTempValueOfOne: _temprature,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              alignment: AlignmentDirectional.topCenter,
                              icon: Icon(
                                Icons.arrow_back,
                                size: size.width / 14,
                              ),
                              onPressed: () {}),
                        ),
                        Center(
                          child: Text(
                            'Smart AC',
                            style: TextStyle(
                                fontSize: size.width / 18,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Center(
                        child: AspectRatio(
                      aspectRatio: 1,
                      child: CustomPaint(
                        painter: TempCirclePainter(
                            minValue: 16,
                            maxValue: 30,
                            currentTempValueOfOne: _temprature),
                      ),
                    )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(size.width / 24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: size.width / 32),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(0.2),
                            borderRadius:
                                BorderRadius.circular(size.width / 24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Temp',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                  fontSize: size.width / 20,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '16°C',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: size.width / 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomSlider.Slider.adaptive(
                                        activeColor: AppColors.white,
                                        inactiveColor:
                                            AppColors.white.withOpacity(0.4),
                                        value: _temprature,
                                        onChanged: (value) {
                                          setState(() {
                                            _temprature = value;
                                          });
                                        }),
                                  ),
                                  Text(
                                    '30°C',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: size.width / 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
