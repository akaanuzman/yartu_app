import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:yartu_app/features/tabs/view/tabbar_view.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (_) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationRoute.generateRoute,
        title: 'YARTU',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Manrope",
        ),
        home: const TabbarView(),
      );
}
