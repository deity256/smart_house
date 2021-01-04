import 'dart:ui';

import 'package:flutter/material.dart';

import '../../colors.dart';
import 'custom_switch.dart';
import 'speed_button.dart';
import 'package:provider/provider.dart';

class SpeedPowerWidget extends StatefulWidget {
  const SpeedPowerWidget({
    Key key,
  }) : super(key: key);

  @override
  _SpeedPowerWidgetState createState() => _SpeedPowerWidgetState();
}

class _SpeedPowerWidgetState extends State<SpeedPowerWidget> {
  @override
  Widget build(BuildContext context) {
    var power = context.watch<ValueNotifier<bool>>();
    var speed = context.watch<ValueNotifier<int>>();

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 32),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width / 24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(size.width / 24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Speed',
                        style: TextStyle(
                          letterSpacing: -0.5,
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
                          Expanded(
                              child: SpeedButton(
                            onTab: () => speed.value = 1,
                            isActive: speed.value == 1,
                            speedNumber: '1',
                          )),
                          Expanded(
                              child: SpeedButton(
                            onTab: () => speed.value = 2,
                            isActive: speed.value == 2,
                            speedNumber: '2',
                          )),
                          Expanded(
                              child: SpeedButton(
                            onTab: () => speed.value = 3,
                            isActive: speed.value == 3,
                            speedNumber: '3',
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width / 24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(size.width / 24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Power',
                        style: TextStyle(
                          letterSpacing: -0.5,
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
                            'OFF/',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: !power.value
                                  ? AppColors.white
                                  : AppColors.white.withOpacity(0.5),
                              fontSize: size.width / 27,
                            ),
                          ),
                          Text(
                            'ON',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: power.value
                                  ? AppColors.white
                                  : AppColors.white.withOpacity(0.5),
                              fontSize: size.width / 27,
                            ),
                          ),
                          Spacer(),
                          CupertinoSwitch(
                            activeColor: AppColors.white.withOpacity(0.5),
                            trackColor: AppColors.white.withOpacity(0.2),
                            onChanged: (value) => power.value = value,
                            value: power.value,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
