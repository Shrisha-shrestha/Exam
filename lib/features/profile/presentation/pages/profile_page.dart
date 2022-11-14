import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:creatu_exam/features/auth/presentation/pages/login.dart';
import 'package:creatu_exam/features/exams/data/models/save_result_drift_model.dart'
    as database;
import 'package:creatu_exam/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:creatu_exam/features/profile/presentation/pages/profile_setting.dart';
import 'package:creatu_exam/features/profile/presentation/widgets/setting_text.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_string.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: StreamBuilder<database.DriftUserModel?>(
          stream: getIt<database.MyExamDatabase>().getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 0.1.sh,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.refresh,
                            ),
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: .08.sh,
                        backgroundColor: AppColors.kPrimaryColor,
                        backgroundImage: NetworkImage(
                          snapshot.data?.image ?? AppString.avatarUrl,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        snapshot.data?.name ?? '',
                        style: const TextStyle(
                          color: AppColors.kTextPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppStyles.kFontOpenSans,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomDecoratedBox(
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_bag,
                            color: AppColors.kPrimaryColor,
                          ),
                          title: SettingText(
                            title: 'Exam List (Registered)',
                          ),
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
                                builder: (context) =>
                                    const ProfileSettingPage(),
                              ),
                            );
                          },
                          leading: const Icon(
                            Icons.shopping_bag,
                            color: AppColors.kPrimaryColor,
                          ),
                          title: const SettingText(
                            title: 'Profile Setting',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDecoratedBox(
                        child: ListTile(
                          onTap: () {
                            context.read<AuthBloc>().add(const LogoutEvent());
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (route) => true,
                            );
                          },
                          leading: const Icon(
                            Icons.logout,
                            color: AppColors.kErrorColor,
                          ),
                          title: const Text(
                            'Log Out',
                            style: TextStyle(
                              color: AppColors.kErrorColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return CustomErrorWidget(message: '${snapshot.error}');
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
