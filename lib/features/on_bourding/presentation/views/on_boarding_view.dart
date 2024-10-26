import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/on_bourding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel_app/features/on_bourding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBourdingView extends StatefulWidget {
  const OnBourdingView({super.key});

  @override
  State<OnBourdingView> createState() => _OnBourdingViewState();
}

class _OnBourdingViewState extends State<OnBourdingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CustomNavBar(),
              OnBoardingBody(),
              CustomBtn(
                text: AppStrings.next,
                onPressed: () {},
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
