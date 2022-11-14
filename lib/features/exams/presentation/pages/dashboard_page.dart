import 'package:creatu_exam/features/exams/presentation/pages/exam_list_page.dart';
import 'package:creatu_exam/features/profile/presentation/pages/profile_page.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final data = await showDialog<bool>(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.1.sw,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.kWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Exit App?',
                          style: TextStyle(
                            fontFamily: AppStyles.kFontOpenSans,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 1,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.kGreyColor.withOpacity(0.4),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context, false);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppStyles.kFontOpenSans,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.kGreyColor.withOpacity(0.4),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                          child: Material(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Exit App',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppStyles.kFontOpenSans,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.kTextPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
        if (data != null) {
          return data;
        }
        return false;
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            ExamPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() => currentIndex = value),
          selectedColorOpacity: 1,
          selectedItemColor: AppColors.kPrimaryColor,
          unselectedItemColor: AppColors.kTextPrimaryColor,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(
                Icons.home,
                color: AppColors.kWhiteColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: currentIndex == 0 ? AppColors.kWhiteColor : null,
                ),
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.menu_book_outlined),
              activeIcon: const Icon(
                Icons.menu_book,
                color: AppColors.kWhiteColor,
              ),
              title: Text(
                'Courses',
                style: TextStyle(
                  color: currentIndex == 1 ? AppColors.kWhiteColor : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseNameTile extends StatelessWidget {
  const CourseNameTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.kTextPrimaryColor,
        fontFamily: AppStyles.kFontOpenSans,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    );
  }
}

class CourseTimeTile extends StatelessWidget {
  const CourseTimeTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.timer_outlined,
          color: AppColors.kTextPrimaryColor,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.kTextPrimaryColor,
            fontFamily: AppStyles.kFontOpenSans,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
