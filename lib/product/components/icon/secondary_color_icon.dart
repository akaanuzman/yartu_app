import 'package:flutter/material.dart';
import '../../../core/extensions/app_extensions.dart';

class SecondaryColorIcon extends Icon {
  SecondaryColorIcon({
    Key? key,
    required BuildContext context,
    required IconData icon,
  }) : super(
          icon,
          key: key,
          color: context.secondaryTextColor,
        );
}
