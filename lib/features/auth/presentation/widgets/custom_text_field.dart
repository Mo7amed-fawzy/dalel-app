import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.isPassword = false, // افتراضي أنه ليس حقل كلمة مرور
    this.isPasswordVisible = false, // افتراضي أن النص مخفي
    this.onPassowrdPressed, // لتبديل حالة الرؤية
  });
  final String labelText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool isPassword;
  final bool isPasswordVisible;
  final void Function()? onPassowrdPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 24.0),
        child: TextFormField(
          obscureText: isPassword && !isPasswordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return isPassword
                  ? "Password is required"
                  : "This field is required";
            } else if (isPassword && value.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
          // يتم استخدام الفاليديتور الممرر كمعامل
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: CustomTextStyles.poppins500style18,
            border: getBorderStyle(),
            enabledBorder: getBorderStyle(),
            focusedBorder: getBorderStyle(),
            // هنا وضعنا الـ suffixIcon داخل InputDecoration
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: onPassowrdPressed,
                  )
                : null,
          ),
        ));
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.grey));
}
