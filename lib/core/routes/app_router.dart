import 'package:dalel_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel_app/features/auth/presentation/views/sign_up.dart';
import 'package:dalel_app/features/on_bourding/presentation/views/on_boarding_view.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

const String toOnbourding = "/onBourding";
const String signUpPage = "/signUp";
const String signInPage = "/signIn";

final GoRouter starterrouter = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: toOnbourding,
    builder: (context, state) => const OnBourdingView(),
  ),
  GoRoute(
    path: signUpPage,
    builder: (context, state) => const SignUpView(),
  ),
  GoRoute(
    path: signInPage,
    builder: (context, state) => const SignInView(),
  ),
]);
