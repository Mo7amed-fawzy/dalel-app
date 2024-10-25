import 'package:dalel_app/features/on_bourding/presentation/views/on_boarding_view.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

const String toOnbourding = "/onBourding";

final GoRouter starterrouter = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: toOnbourding,
    builder: (context, state) => const OnBourdingView(),
  ),
]);
