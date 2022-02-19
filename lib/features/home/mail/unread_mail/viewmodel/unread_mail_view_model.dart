import 'dart:async';

import '../../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../../core/extensions/app_extensions.dart';

class UnreadMailViewModel extends BaseViewModel {
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
