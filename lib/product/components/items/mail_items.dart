import 'package:flutter/material.dart';

import '../../../core/components/text/headline6_text.dart';
import '../../../core/extensions/app_extensions.dart';
import '../text/normal_text.dart';

class MailItems extends Container {
  MailItems({Key? key, required BuildContext context})
      : super(
          key: key,
          decoration: _itemDecoration(context),
          child: _item(context),
        );
  static BoxDecoration _itemDecoration(BuildContext context) => BoxDecoration(
        borderRadius: context.lowBorderRadius,
        border: Border.all(
          color: context.secondaryTextColor.withOpacity(0.5),
        ),
      );

  static ListTile _item(BuildContext context) => ListTile(
        contentPadding: context.paddingNormal,
        leading: _leading(context),
        title: _title(context),
        subtitle: _subtitle(context),
      );

  static AspectRatio _leading(BuildContext context) => AspectRatio(
        aspectRatio: 1.15,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.royalBlue,
            borderRadius: context.lowBorderRadius,
          ),
          child: Headline6Text(
            context: context,
            data: "AA",
            color: Colors.white,
          ),
        ),
      );

  static NormalText _title(BuildContext context) => NormalText(
        data: "Task Examples",
        context: context,
        color: context.label,
      );

  static Column _subtitle(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Dear, yartu team lorem ipsum dolor sit amet...",
            style: TextStyle(color: context.label, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.attach_file,
            color: context.secondaryTextColor,
          ),
          NormalText(
            data: "1 November 2021 • 14.55\n"
                "cihat@yartu.io",
            context: context,
            fontSize: 10,
          ),
        ],
      );
}
