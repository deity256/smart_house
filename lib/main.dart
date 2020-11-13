import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_house/colors.dart';
import 'package:smart_house/router/route_guards.dart';
import 'package:smart_house/router/router.gr.dart';

import 'air_conditioner_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder uses the native nav key to keep
      // the state of ExtendedNavigator so it won't reload
      // when using Flutter tools-> select widget mode
      builder: ExtendedNavigator.builder<AppRouter>(
          router: AppRouter(),
          initialRoute: '/',
          guards: [AuthGuard()],
          builder: (ctx, extendedNav) => Theme(
                data: ThemeData.dark(),
                child: extendedNav,
              )),
    );
  }
}
