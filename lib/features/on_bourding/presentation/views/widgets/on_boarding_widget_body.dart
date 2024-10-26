import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/on_bourding/presentation/views/widgets/custom_smooth_page_indecator.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({super.key});
// تحديد أن الكائن هو ثابت يمكن إنشاؤه مرة واحدة فقط، ويمكن استخدامه في أوقات لاحقة دون الحاجة إلى إعادة إنشائه const
// بس علشان بستعمل فاينال فدا معناه ان المتغيرات دي مش ثابته
  final PageController _pageController = PageController();
  // فاينال يعني هعين قيمته مره وحده بس (غير ثابته)
  @override
  Widget build(BuildContext context) {
    return
        // Expanded(
        SizedBox(
      height: 500,
      //دي البتخليني اسكرول يمين وشمال حسب الداتا العندي
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(children: [
            Container(
              width: 290,
              height: 343,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesOnBoarding1),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Image.asset(Assets.imagesOnBoarding1),
            const SizedBox(height: 24),
            CustomSmoothPageIndicator(controller: _pageController),
            const SizedBox(height: 32),
            Expanded(
              // حطيتها علشان اخلي العنصر يتكيف مع المكان وكان في حل ان احط singlechildscrollview للكولمن
              child: Text(
                'Expolore the history with Dalel in a smart way',
                style: CustomTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Expolore the history with Dalel in a smart way',
              style: CustomTextStyles.poppins300style16,
              textAlign: TextAlign.center,
            ),
          ]);
        },
      ),
    );
  }
}
