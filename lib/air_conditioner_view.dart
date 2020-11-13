import 'package:flutter/material.dart';
import 'package:smart_house/colors.dart';

import 'smoke_animated_background.dart';

class AirConditionerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SmokeAnimatedBackground(),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
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
