import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/views/historical_periods_details_view.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_nav_bar_widget.dart';
import 'package:dalel_app/features/on_bourding/presentation/views/on_boarding_view.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const String toOnbourding = "/onBourding";
const String signUpPage = "/signUp";
const String signInPage = "/signIn";
const String homeView = "/HomeView";
const String forgotPassword = "/ForgotPasswordView";
const String homeNavBar = "/HomeNavBar";
const String historicalPeriodsDetails = "/historicalPeriodsDetailsView";

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
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignUpView(),
    ),
  ),
  GoRoute(
    path: signInPage,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignInView(),
    ),
  ),
  // GoRoute(
  //   path: homeView,
  //   builder: (context, state) => const HomeView(),
  // ),
  GoRoute(
    path: homeNavBar,
    builder: (context, state) => const HomeNavBarWidget(),
  ),
  GoRoute(
    path: historicalPeriodsDetails,
    builder: (context, state) => HistoricalPeriodsDetailsView(
        model: state.extra as HistoricalPeriodsModel),
  ),
  GoRoute(
    path: forgotPassword,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgotPasswordView(),
    ),
  ),
]);
