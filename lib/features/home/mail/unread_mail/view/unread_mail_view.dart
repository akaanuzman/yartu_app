import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/skeleton/skeleton_animation.dart';
import '../../../../../product/components/items/mail_items.dart';
import '../../../../../product/components/list/special_list_view_seperated.dart';
import '../viewmodel/unread_mail_view_model.dart';

class UnreadMailView extends StatelessWidget {
  const UnreadMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<UnreadMailViewModel>(
        viewModel: UnreadMailViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, UnreadMailViewModel viewModel) =>
            Scaffold(
          body: SpecialListViewSeperated(
            child: viewModel.isLoading
                ? MailItems(context: context)
                : SkeletonAnimation(context: context),
          ),
        ),
      );
}
