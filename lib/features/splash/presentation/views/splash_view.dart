import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    checkFirstVisitOrNot(
        context, 'isOnBoardingVisited', signInPage, toOnbourding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}

void checkFirstVisitOrNot(BuildContext context, String key,
    String ifFirstContinue, String ifNoTToOnBoarding) {
  bool isVisited = getIt<CacheHelper>().getData(key: key) ?? false;

  // تأخير الانتقال إلى الصفحة المطلوبة
  Future.delayed(const Duration(seconds: 2), () {
    //ممكن يكون غير صالح بعد مرور الوقت BuildContext فاستعملنا mounted اتاكد لسا متصله بالشجره ولا لا
    if (context.mounted) {
      if (isVisited) {
        FirebaseAuth.instance.currentUser == null // لو معنديش اكونت
            ? customReplacementNavigate(context, ifFirstContinue)
            : customReplacementNavigate(context, homeView);
      } else {
        customReplacementNavigate(context, ifNoTToOnBoarding);
      }
    }
  });
}
