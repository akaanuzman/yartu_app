import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/body_text1.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../product/components/text/normal_text.dart';
import '../viewmodel/folders_view_model.dart';

class FoldersView extends StatelessWidget {
  static const path = '/folders';
  const FoldersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FoldersViewModel>(
      viewModel: FoldersViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FoldersViewModel viewModel) =>
          Scaffold(
        body: _body(context),
      ),
    );
  }

  FadeInUp _body(BuildContext context) => FadeInUp(
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context),
              context.emptySizedHeightBoxLow3x,
              _items
            ],
          ),
        ),
      );

  Padding _title(BuildContext context) => Padding(
        padding: context.horizontalPaddingLow,
        child: BodyText1Text(data: "Folders", context: context),
      );

  Expanded get _items => Expanded(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2),
          itemBuilder: (context, index) => _item(context),
        ),
      );

  Padding _item(BuildContext context) => Padding(
        padding: context.paddingExtraLow,
        child: Container(
          decoration: _border(context),
          child: _content(context),
        ),
      );

  BoxDecoration _border(BuildContext context) => BoxDecoration(
        borderRadius: context.lowBorderRadius,
        border: Border.all(
          color: context.secondaryTextColor.withOpacity(0.5),
        ),
      );

  ListTile _content(BuildContext context) => ListTile(
        title: NormalText(
          data: "1 November 2021 • 14.55",
          context: context,
          fontFamily: "AvenirNext",
          fontSize: 11,
        ),
        subtitle: NormalText(
          data: "Yartu UI",
          context: context,
          fontFamily: "AvenirNext",
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      );
}
