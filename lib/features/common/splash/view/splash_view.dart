import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/headline6_text.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<SplashViewModel>(
        viewModel: SplashViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
            Scaffold(
          body: _body(context),
        ),
      );

  Column _body(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Center(
            child: SvgPicture.asset("assets/images/logo.svg"),
          ),
          context.emptySizedHeightBoxLow,
          // Text
          Center(
            child: Headline6Text(context: context, data: "YARTU"),
          )
        ],
      );
}
