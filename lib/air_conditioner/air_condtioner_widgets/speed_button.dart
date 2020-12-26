import 'package:flutter/material.dart';

import '../../colors.dart';

class SpeedButton extends StatelessWidget {
  final String speedNumber;
  final bool isActive;
  final Function onTab;
  const SpeedButton(
      {Key key, this.isActive = false, this.speedNumber, this.onTab})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            border: isActive ? null : Border.all(color: AppColors.white),
            color: isActive ? AppColors.white : AppColors.transparent,
            shape: BoxShape.circle),
        child: Text(
          speedNumber,
          style: TextStyle(
              color: isActive ? AppColors.black : AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
