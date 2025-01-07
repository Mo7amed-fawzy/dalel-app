import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.color,
    this.text = '',
    this.onPressed,
    this.customWidget,
  });

  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // اعرض customWidget لو موجود ولو مش موجود اعرض الباقي
        child: customWidget ??
            Text(
              text,
              style: CustomTextStyles.poppins500style24.copyWith(
                fontSize: 18,
                color: AppColors.offWhite,
              ),
            ),
      ),
    );
  }
}
