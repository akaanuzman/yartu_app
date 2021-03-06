// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yartu_app/core/init/navigation/navigation_service.dart';
import 'package:yartu_app/product/components/alert/login_alert.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/body_text1.dart';
import '../../../../core/components/text/headline5_text.dart';
import '../../../../core/components/text/headline6_text.dart';
import '../../../../core/components/text/primary_color_text.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../product/components/button/special_button.dart';
import '../../../../product/components/checkbox/special_checkbox.dart';
import '../../../../product/components/text/normal_text.dart';
import '../../../../product/components/textformfield/bordered_text_form_field.dart';
import '../../../tabs/view/tabbar_view.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  static const path = '/login';
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String usernameErrorText = "";
  String passwordErrorText = "";

  LoginView({Key? key}) : super(key: key);

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

  Widget _body(BuildContext context, LoginViewModel viewModel) => FadeInUp(
        child: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: context.paddingMedium,
            children: [
              context.emptySizedHeightBoxNormal,
              _logoTitle(context),
              context.emptySizedHeightBoxLow3x,
              _signInText(context),
              context.emptySizedHeightBoxLow2x,
              _welcomeBackText(context),
              context.emptySizedHeightBoxLow3x,
              NormalText(
                data: "Email or username",
                context: context,
              ),
              context.emptySizedHeightBoxLow2x,
              _emailOrUsername(context, viewModel),
              context.emptySizedHeightBoxLow3x,
              _forgotPassword(context, viewModel),
              _password(context, viewModel),
              context.emptySizedHeightBoxLow2x,
              _rememberMeSection(context, viewModel),
              context.emptySizedHeightBoxLow2x,
              _button(context, viewModel),
              context.emptySizedHeightBoxLow2x,
              const Divider(
                thickness: 1.5,
              ),
              _accountSide(context)
            ],
          ),
        ),
      );

  Wrap _logoTitle(BuildContext context) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: context.normalValue,
        children: [
          SvgPicture.asset("assets/images/logo.svg"),
          SvgPicture.asset("assets/images/Group.svg"),
        ],
      );

  Headline5Text _signInText(BuildContext context) =>
      Headline5Text(context: context, data: "Sign In");

  Headline6Text _welcomeBackText(BuildContext context) => Headline6Text(
        context: context,
        data: "Welcome back, please log in to your account.",
        color: context.secondaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  BorderedTextFormField _emailOrUsername(
          BuildContext context, LoginViewModel viewModel) =>
      BorderedTextFormField(
        context: context,
        controller: usernameController,
        validator: (username) => usernameErrorText = viewModel.appValidator.emailCheck(username),
        hintText: "jhondoe@gmail.com",
        hintStyle: viewModel.normalText(context),
        keyboardType: TextInputType.emailAddress,
        errorText: usernameErrorText,
      );

  Widget _forgotPassword(BuildContext context, LoginViewModel viewModel) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NormalText(data: "Password", context: context),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: viewModel.normalColorText(context),
            ),
          ),
        ],
      );

  BorderedTextFormField _password(
          BuildContext context, LoginViewModel viewModel) =>
      BorderedTextFormField(
        context: context,
        controller: passwordController,
        validator: (password) =>
            passwordErrorText = viewModel.appValidator.passwordCheck(password),
        obscureText: viewModel.isObscure,
        hintText: "Password",
        hintStyle: viewModel.normalText(context),
        suffixIcon: IconButton(
          onPressed: viewModel.changeIsObscure,
          icon: Icon(
            Icons.visibility,
            color: viewModel.isObscure
                ? context.secondaryTextColor
                : context.primaryColor,
          ),
        ),
        errorText: passwordErrorText,
      );

  Wrap _rememberMeSection(BuildContext context, LoginViewModel viewModel) =>
      Wrap(
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

  SpecialButton _button(BuildContext context, LoginViewModel viewModel) =>
      SpecialButton(
        context: context,
        data: 'Sing In',
        borderRadius: context.extraLowBorderRadius,
        onTap: () async {
          await viewModel.fetchLoginItems(
              usernameController.text, passwordController.text);
          if (viewModel.item.ok != null) {
            viewModel.item.ok!
                ? NavigationService.pushNamed(TabbarView.path)
                : _showAlertDialog(context, viewModel);
          }
          _formKey.currentState!.validate();
        },
      );

  Center _accountSide(BuildContext context) => Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            NormalText(
              data: "Don't have an account?",
              context: context,
            ),
            TextButton(
              onPressed: () {},
              child: PrimaryColorText(data: "Create account", context: context),
            )
          ],
        ),
      );

  void _showAlertDialog(BuildContext context, LoginViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) => LoginAlert(
        context: context,
        viewModel: viewModel,
      ),
    );
  }
}
