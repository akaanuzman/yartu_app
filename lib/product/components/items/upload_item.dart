import 'package:flutter/material.dart';
import '../../../core/extensions/app_extensions.dart';
import '../text/normal_text.dart';

class UploadItem extends ListTile {
  UploadItem({
    Key? key,
    required BuildContext context,
    required IconData icon,
    required String text,
    Color? tileColor
  }) : super(
          key: key,
          leading: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: context.lowValue,
            children: [
              Icon(icon),
              NormalText(data: text, context: context),
            ],
          ),
          onTap: () {},
          tileColor: tileColor
        );
}
