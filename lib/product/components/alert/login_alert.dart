import 'package:animate_do/animate_do.dart';
import 'package:yartu_app/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:yartu_app/features/auth/login/viewmodel/login_view_model.dart';

import '../../../core/init/navigation/navigation_service.dart';
import '../button/special_button.dart';

class LoginAlert extends AlertDialog {
  LoginAlert({
    Key? key,
    required BuildContext context,
    required LoginViewModel viewModel,
  }) : super(
          key: key,
          shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
          title: _title(context),
          content: _content,
          contentTextStyle: viewModel.normalText(context),
          actions: [_okButton(context)],
        );

  static FlipInY _title(BuildContext context) => FlipInY(
        child: CircleAvatar(
          backgroundColor: context.red,
          child: Icon(
            Icons.error,
            color: context.background,
          ),
        ),
      );

  static FlipInY get _content => FlipInY(
        child: const Text("Wrong email or password please try again."),
      );

  static FlipInY _okButton(BuildContext context) => FlipInY(
        child: SpecialButton(
          context: context,
          data: "Ok",
          onTap: () => NavigationService.pop(),
        ),
      );
}
