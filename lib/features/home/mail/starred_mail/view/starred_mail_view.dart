import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/skeleton/skeleton_animation.dart';
import '../../../../../product/components/items/mail_items.dart';
import '../../../../../product/components/list/special_list_view_seperated.dart';
import '../viewmodel/starred_mail_view_model.dart';

class StarredMailView extends StatelessWidget {
  const StarredMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<StarredMailViewModel>(
        viewModel: StarredMailViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, StarredMailViewModel viewModel) =>
            Scaffold(
          body: SpecialListViewSeperated(
            child: viewModel.isLoading
                ? MailItems(context: context)
                : SkeletonAnimation(context: context),
          ),
        ),
      );
}
