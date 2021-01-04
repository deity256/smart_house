import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:smart_house/colors.dart';
import 'package:provider/provider.dart';

class SmokeAnimatedBackground extends StatefulWidget {
  const SmokeAnimatedBackground({
    Key key,
  }) : super(key: key);
  @override
  _SmokeAnimatedBackgroundState createState() =>
      _SmokeAnimatedBackgroundState();
}

class _SmokeAnimatedBackgroundState extends State<SmokeAnimatedBackground>
    with SingleTickerProviderStateMixin {
  GifController _gifController;
  @override
  void initState() {
    var speed = context.read<ValueNotifier<int>>();
    var power = context.read<ValueNotifier<bool>>();

    _gifController = GifController(
      vsync: this,
    );

    //listen to power switch
    power.addListener(() {
      if (power.value)
        _gifController.repeat(
            min: 0,
            max: 59,
            period: Duration(milliseconds: _speedFactor(speed)));
      else
        _gifController.stop();
    });
    //listen to speed buttons
    speed.addListener(() {
      if (power.value)
        _gifController.repeat(
            min: 0,
            max: 59,
            period: Duration(milliseconds: _speedFactor(speed)));
    });

    super.initState();
  }

  int _speedFactor(ValueNotifier<int> speed) => 3250 - (1000 * speed.value);

  @override
  Widget build(BuildContext context) {
    var temp = context.watch<ValueNotifier<double>>();

    return SizedBox.expand(
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.white.withOpacity(0.85),
                AppColors.lerpGradient(temp.value)
              ],
              stops: [
                0.01,
                0.5
              ]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.screen,
        child: RotatedBox(
          quarterTurns: 2,
          child: GifImage(
            fit: BoxFit.fill,
            alignment: Alignment.center,
            color: AppColors.white,
            colorBlendMode: BlendMode.softLight,
            controller: _gifController,
            image: AssetImage("assets/smoke.gif"),
          ),
        ),
      ),
    );
  }
}
