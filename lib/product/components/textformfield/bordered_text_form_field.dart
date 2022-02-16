import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/extensions/app_extensions.dart';
import 'app_text_form_field.dart';

class BorderedTextFormField extends AppTextFormField {
  BorderedTextFormField({
    Key? key,
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
  }) : super(
          key: key,
          context: context,
          labelText: labelText,
          obscureText: obscureText,
          prefix: prefix,
          suffix: suffix,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          enabledBorder: OutlineInputBorder(
            borderRadius: context.lowBorderRadius,
            borderSide: BorderSide(color: context.grey4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: context.lowBorderRadius,
            borderSide: BorderSide(color: context.grey),
          ),
        );
}
