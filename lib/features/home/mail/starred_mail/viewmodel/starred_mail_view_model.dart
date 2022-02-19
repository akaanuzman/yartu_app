import 'dart:async';

import '../../../../../core/extensions/app_extensions.dart';

import '../../../../../core/base/viewmodel/base_view_model.dart';

class StarredMailViewModel extends BaseViewModel {
  bool isLoading = false;

  @override
  void init() {
    Timer(context.durationNormal, loadPage);
  }

  // Method that makes data come animatically
  void loadPage() {
    isLoading = true;
    setState();
  }
}
