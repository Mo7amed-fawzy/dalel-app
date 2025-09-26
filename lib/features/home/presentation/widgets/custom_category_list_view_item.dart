import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 74,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage(
                  Assets.imagesFrame3,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(
            "Lionheart",
            style: CustomTextStyles.poppins500style14.copyWith(
              color: AppColors.deepBrown,
              letterSpacing: 0.3,
            ),
          )
        ],
      ),
    );
  }
}
