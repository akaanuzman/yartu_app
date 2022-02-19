import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class NormalText extends Text {
  NormalText({
    Key? key,
    required String data,
    required BuildContext context,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize
  }) : super(
          data,
          key: key,
          style: TextStyle(
            fontWeight: fontWeight ?? FontWeight.w600,
            color: color ?? context.textColor,
            fontSize: fontSize,
          ),
        );
}
