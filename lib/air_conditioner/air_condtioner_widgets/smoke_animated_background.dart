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

    power.addListener(() {
      if (power.value)
        _gifController.repeat(
            min: 0,
            max: 75,
            period: Duration(milliseconds: 4000 - 1000 * speed.value));
      else
        _gifController.stop();
    });

    speed.addListener(() {
      if (power.value)
        _gifController.repeat(
            min: 0,
            max: 75,
            period: Duration(milliseconds: 4000 - 1000 * speed.value));
    });

    super.initState();
  }

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
              AppColors.white.withAlpha(200),
              AppColors.lerpGradient(temp.value)
            ],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.screen,
        child: GifImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          controller: _gifController,
          image: AssetImage("assets/smoke_gif.gif"),
        ),
      ),
    );
  }
}
