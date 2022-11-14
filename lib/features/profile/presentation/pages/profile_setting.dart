import 'package:creatu_exam/core/network/api_endpoints.dart';
import 'package:creatu_exam/features/Profile/presentation/widgets/setting_text.dart';
import 'package:creatu_exam/features/profile/presentation/pages/about_page.dart';
import 'package:creatu_exam/features/profile/presentation/pages/change_password.dart';
import 'package:creatu_exam/features/profile/presentation/pages/privacy_page.dart';
import 'package:creatu_exam/features/profile/presentation/pages/update_profile_page.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ProfileSettingPage extends StatelessWidget {
  const ProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Setting',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CourseTitleWidget(title: 'Profile Setting'),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                ),
                child: Column(
                  children: [
                    CustomDecoratedBox(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpdateProfilePage(),
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        title: const SettingText(title: 'Edit Profile'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDecoratedBox(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ChangePasswordPage();
                              },
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.key,
                          color: AppColors.kPrimaryColor,
                        ),
                        title: const SettingText(title: 'Change Password'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const CourseTitleWidget(title: 'Help'),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 6,
                ),
                child: Column(
                  children: [
                    CustomDecoratedBox(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const PrivacyPage(
                                  endpoints: ApiEndPoints.disclaimer,
                                  title: 'Disclaimer',
                                  mapKey: 'disclaimer',
                                );
                              },
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.file_open_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        title: const SettingText(title: 'Disclaimer'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDecoratedBox(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const PrivacyPage(
                                  endpoints: ApiEndPoints.termsAndCondition,
                                  title: 'Terms And Condition',
                                  mapKey: 'termsAndCondition',
                                );
                              },
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.file_open_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        title: const SettingText(title: 'Terms And Condition'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDecoratedBox(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const PrivacyPage(
                                  endpoints: ApiEndPoints.privacyPolicy,
                                  title: 'Privacy Policy',
                                  mapKey: 'privacy',
                                );
                              },
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.shield_moon,
                          color: AppColors.kPrimaryColor,
                        ),
                        title: const SettingText(title: 'Privacy Policy'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomDecoratedBox(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const AboutUsPage();
                              },
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.live_help_outlined,
                          color: AppColors.kPrimaryColor,
                        ),
                        title: const SettingText(title: 'Contact Us'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
