import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PeriodDetailsSection extends StatelessWidget {
  const PeriodDetailsSection(
      {super.key,
      required this.periodName,
      required this.description,
      required this.imageUrl});
  final String periodName;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(text: "$periodName Period"),
            const SizedBox(width: 7),
            SvgPicture.asset("assets/images/details_icon.svg"),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -20,
                    left: -10,
                    child: SvgPicture.asset("assets/images/decorative1.svg"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.offWhite,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Text(
                      description,
                      style: CustomTextStyles.poppins500style18
                          .copyWith(color: AppColors.deepBrown),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                width: 130,
                height: 200,
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      ],
    );
  }
}
