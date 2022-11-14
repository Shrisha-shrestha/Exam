import 'package:creatu_exam/features/exams/presentation/widgets/custom_title_value.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/widgets/app_button.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamDetailPage extends StatelessWidget {
  const ExamDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Exam Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: CustomDecoratedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CourseTitleWidget(
                          title: 'Bibendum sit rutrum felis ac uta massa Exam',
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        TitleValueWidget(
                          title: 'Start Time: ',
                          value: '1:00 PM',
                        ),
                        TitleValueWidget(
                          title: 'Time: ',
                          value: '1 Hour 30 Minutes',
                        ),
                        TitleValueWidget(
                          title: 'Marks: ',
                          value: '50 Marks',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomDecoratedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CourseTitleWidget(
                          title: 'Rules and Instructions:',
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        ListTile(
                          dense: true,
                          leading: Transform.rotate(
                            angle: 90,
                            child: const Icon(
                              Icons.square,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                          title: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat aenean molestie felis ullamcorper tellus ipsum. ',
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: Transform.rotate(
                            angle: 90,
                            child: const Icon(
                              Icons.square,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                          title: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat aenean molestie felis ullamcorper tellus ipsum. ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 0.5.sw,
                child: AppButton(
                  title: 'Take Exam',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Container();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
