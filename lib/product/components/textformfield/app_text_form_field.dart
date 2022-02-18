import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extensions/app_extensions.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField(
      {Key? key,
      required BuildContext context,
      String? labelText,
      TextStyle? labelStyle,
      String? hintText,
      TextStyle? hintStyle,
      String? initialValue,
      String? Function(String?)? validator,
      Function(String?)? onSaved,
      Function(String)? onChanged,
      bool saveAttempted = false,
      TextInputAction textInputAction = TextInputAction.next,
      TextInputType? keyboardType,
      bool obscureText = false,
      EdgeInsetsGeometry? contentPadding,
      IconButton? suffixIcon,
      Widget? prefixIcon,
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
            contentPadding: contentPadding,
            prefix: prefix,
            suffix: suffix,
            labelText: labelText,
            labelStyle: labelStyle ??
                context.textTheme.subtitle1!.copyWith(
                  color: context.secondaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
            hintText: hintText,
            hintStyle: hintStyle ??
                context.textTheme.subtitle1!.copyWith(
                  color: context.secondaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            errorText: errorText,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
          style: context.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w600,
            color: context.textColor,
          ),
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          textAlign: TextAlign.left,
          key: key,
        );
}
