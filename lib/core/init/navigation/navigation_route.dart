import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;
import '../../../features/home/mail/tab/view/mail_tab_view.dart';
import '../../../features/home/upload/view/upload_view.dart';

import '../../../features/auth/login/view/login_view.dart';
import '../../../features/home/folders/view/folders_view.dart';
import '../../../features/tabs/view/tabbar_view.dart';

class NavigationRoute {
  static Route<CupertinoPageRoute> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments; //argumanlar

    switch (settings.name) {
      case LoginView.path:
        return CupertinoPageRoute(builder: (_) => LoginView());
      case TabbarView.path:
        return CupertinoPageRoute(builder: (_) => TabbarView());
      case MailTabView.path:
        return CupertinoPageRoute(builder: (_) => MailTabView());
      case UploadView.path:
        return CupertinoPageRoute(builder: (_) => const UploadView());
      case FoldersView.path:
        return CupertinoPageRoute(builder: (_) => const FoldersView());
      default:
        return CupertinoPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Not Found'))),
        );
    }
  }
}
