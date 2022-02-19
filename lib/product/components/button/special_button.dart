import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';
import '../text/normal_text.dart';

class SpecialButton extends ElevatedButton {
  SpecialButton({
    Key? key,
    void Function()? onTap,
    required BuildContext context,
    String? data,
    Widget? child,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          onPressed: onTap ?? () {},
          child: child ??
              NormalText(
                data: data ?? "",
                context: context,
                color: Colors.white,
              ),
          style: _style(context, borderRadius ?? context.lowBorderRadius),
          key: key,
        );

  static ButtonStyle _style(
          BuildContext context, BorderRadiusGeometry borderRadius) =>
      ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.blue[300]!.withOpacity(0.2);
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return Colors.blue[300]!.withOpacity(0.2);
            }
            return context.primaryColor;
          },
        ),
        backgroundColor: MaterialStateProperty.all<Color>(context.primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      );
}
