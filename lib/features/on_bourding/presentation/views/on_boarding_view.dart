import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/on_bourding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBourdingView extends StatefulWidget {
  const OnBourdingView({super.key});

  @override
  State<OnBourdingView> createState() => _OnBourdingViewState();
}

class _OnBourdingViewState extends State<OnBourdingView> {
  @override
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(AppStrings.skip),
            OnBoardingBody(),
          ],
        ),
      ),
    );
  }
}
