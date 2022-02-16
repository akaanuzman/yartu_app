import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;

import '../../../features/auth/login/view/login_view.dart';

class NavigationRoute {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments; //argumanlar

    switch (settings.name) {
      case LoginView.path:
        return CupertinoPageRoute(builder: (_) => const LoginView());
      default:
        return CupertinoPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Not Found'))),
        );
    }
  }
}
