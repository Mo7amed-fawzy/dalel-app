import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              customNavigate(context, signUpPage);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
