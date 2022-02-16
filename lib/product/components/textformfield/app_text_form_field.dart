import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extensions/app_extensions.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField(
      {Key? key,
      required BuildContext context,
      required String labelText,
      TextStyle? labelStyle,
      String? initialValue,
      String? Function(String?)? validator,
      Function(String?)? onSaved,
      Function(String)? onChanged,
      bool saveAttempted = false,
      TextInputAction textInputAction = TextInputAction.next,
      TextInputType? keyboardType,
      bool obscureText = false,
      IconButton? suffixIcon,
      Widget? prefix,
      Widget? suffix,
      String? errorText,
      List<TextInputFormatter>? inputFormatters,
      OutlineInputBorder? enabledBorder,
      OutlineInputBorder? focusedBorder})
      : super(
          initialValue: initialValue,
          autovalidateMode: saveAttempted
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            prefix: prefix,
            suffix: suffix,
            labelText: labelText,
            labelStyle: labelStyle ??
                context.textTheme.subtitle1!.copyWith(
                  color: context.textColor,
                  fontWeight: FontWeight.w500,
                ),
            suffixIcon: suffixIcon,
            errorText: errorText,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
          style: context.textTheme.subtitle2!
              .copyWith(fontWeight: FontWeight.w600, color: context.textColor),
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          key: key,
        );
}
