import 'package:yartu_app/features/auth/login/model/login_model.dart';
import 'package:yartu_app/features/auth/login/service/ILoginService.dart';
import 'package:yartu_app/features/auth/login/service/login_service.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  late final ILoginService loginService;
  LoginModel item = LoginModel();
  bool isRemember = false;
  bool isObscure = true;

  @override
  void init() {
    loginService = LoginService(networkManager.dio);
  }

  // Api connection
  Future<void> fetchLoginItems(String username, String password) async {
    item = await loginService.fetchLoginItems(username, password);
    // debugPrint(item.ok.toString());
    setState();
  }

  // Keep me logged in method
  void changeIsRemember() {
    isRemember = !isRemember;
    setState();
  }

  // Show password method
  void changeIsObscure() {
    isObscure = !isObscure;
    setState();
  }
}
