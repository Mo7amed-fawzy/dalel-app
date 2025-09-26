import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/models/data_model.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem(
      {super.key, required this.model, required this.routePath});
  final DataModel model;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, routePath, extra: model);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.offWhite,
              AppColors.offWhite.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        width: 164,
        height: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 15),
            SizedBox(
              height: 48,
              width: 65,
              child: Text(
                model.name,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: CustomTextStyles.poppins500style18.copyWith(
                  fontSize: 16,
                  color: AppColors.deepBrown,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            SizedBox(
              height: 64,
              width: 47,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: model.image,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 47,
                      height: 64,
                      color: AppColors.grey,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColors.deepBrown),
                ),
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
