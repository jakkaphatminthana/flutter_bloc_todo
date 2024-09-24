import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/core/theme/app_color.dart';
import 'package:flutter_bloc_todo/core/theme/text_styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextfield extends ReactiveTextField {
  CustomReactiveTextfield({
    Key? key,
    String? formControlName,
    String? hintText,
    ShowErrorsFunction? showError,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool readOnly = false,
    TextInputType? keyboardType,
    int? maxLines = 1,
    int? maxLength,
    bool expands = false,
    TextAlignVertical? textAlignVertical,
    Map<String, ValidationMessageFunction>? validationMessages,
    ReactiveFormFieldCallback? onTap,
    ReactiveFormFieldCallback? onChange,
    Widget? suffix,
    bool hideOriginalErrorText = false,
    TextStyle? style,
  }) : super(
          key: key,
          showErrors: showError,
          formControlName: formControlName,
          obscureText: obscureText,
          validationMessages: validationMessages,
          onChanged: onChange,
          readOnly: readOnly,
          style: style ??
              AppCustomTextStyle.body3().merge(
                TextStyle(
                  color: readOnly ? AppColor.gray3 : AppColor.gray7,
                ),
              ),
          keyboardType: keyboardType,
          maxLines: maxLines,
          maxLength: maxLength,
          expands: expands,
          textAlignVertical: textAlignVertical,
          onTap: onTap,
          decoration: InputDecoration(
            counterText: "",
            labelText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: AppCustomTextStyle.body3().merge(
              const TextStyle(color: AppColor.gray3),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            isDense: true,
            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: suffixIcon,
            ),
            suffix: suffix,
            suffixIconConstraints: const BoxConstraints(
              maxWidth: 48,
              minHeight: 38,
            ),

            //> background
            filled: true,
            fillColor: Colors.white,

            //> border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.gray2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.gray2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.gray3),
            ),

            //> error
            errorStyle: hideOriginalErrorText
                ? const TextStyle(height: 0, fontSize: 0)
                : AppCustomTextStyle.body5().merge(
                    const TextStyle(color: AppColor.pink5),
                  ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColor.pink5),
            ),
          ),
        );
}
