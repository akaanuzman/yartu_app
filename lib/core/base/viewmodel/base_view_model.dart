import 'package:flutter/material.dart';
import 'package:yartu_app/core/extensions/app_extensions.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext context;

  void setState() {
    notifyListeners();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {}

  TextStyle normalText(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        color: context.textColor,
      );

  TextStyle normalColorText(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        color: context.primaryColor,
      );
}
