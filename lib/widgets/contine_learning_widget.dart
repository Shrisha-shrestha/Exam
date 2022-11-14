import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:creatu_exam/res/app_colors.dart';

import 'package:creatu_exam/widgets/title_widget.dart';

class ContinueLearningWidget extends StatelessWidget {
  const ContinueLearningWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.duration,
    this.onPressed,
  });

  final String imageUrl;
  final String title;
  final String duration;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.sp,
            ),
            const CourseTitleWidget(
              title: 'Continue Learning',
            ),
            SizedBox(
              height: 10.sp,
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    'https://www.groovypost.com/wp-content/uploads/2019/04/laptop-keyboard-featured.jpg',
                  ),
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 1,
                      right: 1,
                      bottom: 1,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            const CourseTitleWidget(
                              title:
                                  '5. Bibendum sit rutrum felis ac uta massa.',
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CourseTitleWidget(
                                  title: '20 Mins',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
