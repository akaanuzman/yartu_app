import 'package:flutter/material.dart';
import '../../../core/extensions/app_extensions.dart';

class DrawerItem extends Padding {
  DrawerItem({
    Key? key,
    required BuildContext context,
    required IconData icon,
    required String text,
  }) : super(
            padding: context.verticalPaddingLow,
            key: key,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: context.lowValue,
              children: [
                Icon(
                  icon,
                  color: context.textColor,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: context.textColor, fontWeight: FontWeight.w600),
                )
              ],
            ));
}
