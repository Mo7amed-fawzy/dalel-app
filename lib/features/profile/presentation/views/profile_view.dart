import 'package:flutter/material.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.offWhite,
                AppColors.primaryColor.withOpacity(0.2)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: CustomTextStyles.pacifico400style64
                          .copyWith(fontSize: 28),
                    ),
                    Icon(Icons.person, color: AppColors.deepBrown, size: 32),
                  ],
                ),
                const SizedBox(height: 30),

                // Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: AppColors.offWhite,
                  ),
                ),
                const SizedBox(height: 20),

                // Name
                Text(
                  "Mohamed Fawzy",
                  style: CustomTextStyles.pacifico400style64
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(height: 8),

                // Email
                Text(
                  "m07amed1st@gmail.com",
                  style: CustomTextStyles.poppins400style12.copyWith(
                    color: AppColors.deepGrey,
                  ),
                ),
                const SizedBox(height: 30),

                // Stats Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ProfileStat(title: "Places Visited", value: "15"),
                    _ProfileStat(title: "Historic Tours", value: "5"),
                    _ProfileStat(title: "Favorites", value: "12"),
                  ],
                ),
                const SizedBox(height: 30),

                // Options List
                Expanded(
                  child: ListView(
                    children: const [
                      _ProfileOption(icon: Icons.history, text: "History"),
                      _ProfileOption(icon: Icons.favorite, text: "Favorites"),
                      _ProfileOption(icon: Icons.settings, text: "Settings"),
                      _ProfileOption(icon: Icons.logout, text: "Logout"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String title;
  final String value;
  const _ProfileStat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: CustomTextStyles.poppins600style28.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: CustomTextStyles.poppins400style12,
        ),
      ],
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ProfileOption({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 6,
      shadowColor: AppColors.deepBrown.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.deepBrown),
        title: Text(text, style: CustomTextStyles.poppins400style20),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.lightGrey),
        onTap: () {
          // TODO: Handle tap
        },
      ),
    );
  }
}
