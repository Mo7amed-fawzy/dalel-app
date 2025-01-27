import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/functions/print_statement.dart';
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

  Future.delayed(const Duration(seconds: 2), () {
    if (context.mounted) {
      printHere('isVisited: $isVisited');
      printHere('currentUser: ${FirebaseAuth.instance.currentUser}');

      if (isVisited) {
        if (FirebaseAuth.instance.currentUser != null) {
          checkEmailVerifiedOrNot(context, homeNavBar, signInPage);
        } else {
          customReplacementNavigate(context, signInPage);
        }
      } else {
        customReplacementNavigate(context, ifNoTToOnBoarding);
      }
    }
  });
}

void checkEmailVerifiedOrNot(BuildContext context, String home, String signIn) {
  bool isVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;
  printHere('emailVerified: $isVerified');

  isVerified
      ? customReplacementNavigate(context, home)
      : customReplacementNavigate(context, signIn);
}

// void checkEmailVerifiedOrNot(
//     BuildContext context, String homePage, String signInPage) {
//   FirebaseAuth.instance.currentUser?.emailVerified == false
//       ? customReplacementNavigate(context, signInPage)
//       : customReplacementNavigate(context, homePage);
// }
