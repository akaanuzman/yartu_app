import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/body_text1.dart';
import '../../../../core/components/text/primary_color_text.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/components/text/headline6_text.dart';
import '../../../../product/components/button/special_button.dart';
import '../../../../product/components/checkbox/special_checkbox.dart';
import '../../../../product/components/textformfield/bordered_text_form_field.dart';
import '../../../../core/components/text/headline4_text.dart';
import '../../../../core/components/text/headline5_text.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  static const path = '/login';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
            Scaffold(
          body: _body(context, viewModel),
        ),
      );

  ListView _body(BuildContext context, LoginViewModel viewModel) => ListView(
        padding: context.paddingMedium,
        children: [
          context.emptySizedHeightBoxNormal,
          _logoTitle(context),
          context.emptySizedHeightBoxLow3x,
          _signInText(context),
          context.emptySizedHeightBoxLow2x,
          _welcomeBackText(context),
          context.emptySizedHeightBoxLow3x,
          _emailOrUsername(context),
          context.emptySizedHeightBoxLow3x,
          _forgotPassword(context),
          _password(context, viewModel),
          context.emptySizedHeightBoxLow2x,
          _rememberMeSection(context, viewModel),
          context.emptySizedHeightBoxLow2x,
          SpecialButton(context: context, data: 'Sing In'),
          context.emptySizedHeightBoxLow2x,
          const Divider(
            thickness: 1.5,
          ),
          _accountSide(context)
        ],
      );

  Wrap _logoTitle(BuildContext context) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: context.normalValue,
        children: [
          SvgPicture.asset("assets/images/logo.svg"),
          Headline4Text(context: context, data: "YARTU"),
        ],
      );

  Headline5Text _signInText(BuildContext context) =>
      Headline5Text(context: context, data: "Sign In");

  Headline6Text _welcomeBackText(BuildContext context) => Headline6Text(
        context: context,
        data: "Welcome back, please log in to your account.",
        color: context.secondaryTextColor,
        fontWeight: FontWeight.normal,
      );

  BorderedTextFormField _emailOrUsername(BuildContext context) =>
      BorderedTextFormField(
        context: context,
        labelText: "Email or Username",
        keyboardType: TextInputType.emailAddress,
      );

  Align _forgotPassword(BuildContext context) => Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password ?",
            style: TextStyle(color: context.primaryColor),
          ),
        ),
      );

  BorderedTextFormField _password(
          BuildContext context, LoginViewModel viewModel) =>
      BorderedTextFormField(
        context: context,
        obscureText: viewModel.isObscure,
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: viewModel.changeIsObscure,
          icon: Icon(
            Icons.visibility,
            color: viewModel.isObscure
                ? context.secondaryTextColor
                : context.primaryColor,
          ),
        ),
      );

  Wrap _rememberMeSection(BuildContext context, LoginViewModel viewModel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SpecialCheckBox(
          context: context,
          value: viewModel.isRemember,
          onChanged: (value) => viewModel.changeIsRemember(),
        ),
        BodyText1Text(context: context, data: "Keep me logged in")
      ],
    );
  }

  Center _accountSide(BuildContext context) => Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () {},
              child: PrimaryColorText(data: "Create account", context: context),
            )
          ],
        ),
      );
}
