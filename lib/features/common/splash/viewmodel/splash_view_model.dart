import 'dart:async';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../auth/login/view/login_view.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void init() {
    Timer(context.durationNormal, goToLogin);
  }

  void goToLogin() => NavigationService.pushNamed(LoginView.path);
}
