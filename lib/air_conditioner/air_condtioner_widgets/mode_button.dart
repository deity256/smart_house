import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../colors.dart';
import 'package:provider/provider.dart';

class ModeButton extends StatelessWidget {
  final String svgPath;
  final bool active;
  final Function onTap;
  const ModeButton(
      {Key key, @required this.svgPath, this.active = false, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var currentColor =
        AppColors.lerpGradient(context.watch<ValueNotifier<double>>().value);
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1.05,
        child: Container(
            padding: EdgeInsets.all(size.width / 15),
            decoration: BoxDecoration(
              color: active ? AppColors.white : currentColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(size.width / 24),
            ),
            child: SvgPicture.asset(
              svgPath,
              color: active ? null : AppColors.white,
            )),
      ),
    );
  }
}
