import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class SpecialCheckBox extends Checkbox {
  SpecialCheckBox(
      {Key? key,
      required BuildContext context,
      required bool value,
      required void Function(bool?)? onChanged})
      : super(
          key: key,
          value: value,
          onChanged: onChanged ?? (value) {},
          fillColor: MaterialStateProperty.all(
            value == true ? context.primaryColor : context.grey5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: context.lowBorderRadius*0.6,
          ),
        );
}
