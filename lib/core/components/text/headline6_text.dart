import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class Headline6Text extends Text {
  Headline6Text({
    Key? key,
    required BuildContext context,
    required String data,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) : super(
          data,
          key: key,
          style: context.textTheme.headline6!.copyWith(
            color: color ?? context.textColor,
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize
          ),
        );
}
