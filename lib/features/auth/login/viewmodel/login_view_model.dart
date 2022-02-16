import '../../../../core/base/viewmodel/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  bool isRemember = false;
  bool isObscure = true;

  @override
  void init() {}

  void changeIsRemember() {
    isRemember = !isRemember;
    setState();
  }

  void changeIsObscure() {
    isObscure = !isObscure;
    setState();
  }
}
