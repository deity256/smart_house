import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_house/colors.dart';

import 'air_condtioner_widgets/modes_buttons.dart';
import 'air_condtioner_widgets/smoke_animated_background.dart';
import 'air_condtioner_widgets/speed_power_widget.dart';
import 'air_condtioner_widgets/temp_circle_painter.dart';
import 'air_condtioner_widgets/custom_slider.dart' as CustomSlider;

class AirConditionerView extends StatefulWidget {
  @override
  _AirConditionerViewState createState() => _AirConditionerViewState();
}

class _AirConditionerViewState extends State<AirConditionerView> {
  ValueNotifier<int> _airSpeed = ValueNotifier(1);
  ValueNotifier<double> _temprature = ValueNotifier(0.0);
  ValueNotifier<bool> _acPowerOn = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: _airSpeed,
          ),
          ChangeNotifierProvider.value(
            value: _temprature,
          ),
          ChangeNotifierProvider.value(
            value: _acPowerOn,
          ),
        ],
        child: Stack(
          children: [
            SmokeAnimatedBackground(),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 24,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  ModesButtons(),
                  Center(
                      child: AspectRatio(
                    aspectRatio: 1,
                    child: CustomPaint(
                      painter: TempCirclePainter(
                        minValue: 16,
                        currentTempValueOfOne: _temprature.value,
                        maxValue: 30,
                      ),
                    ),
                  )),
                  Spacer(),
                  Column(
                    children: [
                      SpeedPowerWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(size.width / 24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width / 32),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.14),
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
                                          value: _temprature.value,
                                          onChanged: (value) {
                                            setState(() {
                                              _temprature.value = value;
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
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
