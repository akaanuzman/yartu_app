import 'package:flutter/material.dart';
import 'package:yartu_app/core/base/view/base_view.dart';
import 'package:yartu_app/core/extensions/app_extensions.dart';
import 'package:yartu_app/product/components/text/normal_text.dart';

import '../viewmodel/all_mail_view_model.dart';

class AllMailView extends StatelessWidget {
  const AllMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<AllMailViewModel>(
        viewModel: AllMailViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, AllMailViewModel viewModel) =>
            Scaffold(
          body: ListView.separated(
            padding: context.paddingLow,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: AspectRatio(
                  aspectRatio: 1.25,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.royalBlue,
                      borderRadius: context.lowBorderRadius,
                    ),
                    child: NormalText(
                      data: "AA",
                      context: context,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) =>
                context.emptySizedHeightBoxLow3x,
            itemCount: 5,
          ),
        ),
      );
}
