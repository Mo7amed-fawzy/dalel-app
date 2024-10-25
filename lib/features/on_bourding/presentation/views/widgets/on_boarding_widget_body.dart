import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //دي البتخليني اسكرول يمين وشمال حسب الداتا العندي
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [Image.asset(Assets.imagesOnBoarding1)],
          );
        },
      ),
    );
  }
}
