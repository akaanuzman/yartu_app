import 'package:flutter/material.dart';
import 'package:yartu_app/core/extensions/app_extensions.dart';

class NormalText extends Text {
  NormalText({
    Key? key,
    required String data,
    required BuildContext context,
    Color? color,
  }) : super(
          data,
          key: key,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: color ?? context.textColor,
          ),
        );
}
