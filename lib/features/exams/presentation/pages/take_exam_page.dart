import 'dart:async';
import 'dart:ui';

import 'package:creatu_exam/core/helper/helper.dart';
import 'package:creatu_exam/features/exams/data/models/exam_model.dart';
import 'package:creatu_exam/features/exams/presentation/pages/exam_result.dart';
import 'package:creatu_exam/features/exams/presentation/widgets/custom_title_value.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/html_widget.dart';
import 'package:creatu_exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TakeExamPage extends StatefulWidget {
  const TakeExamPage({super.key, required this.examData, required this.email});

  final ExamModel examData;
  final String email;

  @override
  State<TakeExamPage> createState() => _TakeExamPageState();
}

class _TakeExamPageState extends State<TakeExamPage> {
  Set<int> questionIdSet = {};

  final Map<int, String?> questionAnswer = {};

  final attemptNotifier = ValueNotifier<bool>(false);

  int totalMarks() {
    if (widget.examData.format == 'tyep2') {
      return 2 * (widget.examData.questions?.length ?? 0);
    }
    return 1 * (widget.examData.questions?.length ?? 0);
  }

  // Stream<Duration> getDuration({
  //   required String? datetime,
  //   required String? duration,
  // }) async* {
  //   while (Helper.isExamRunning(
  //     datetime: datetime,
  //     duration: duration,
  //   )) {
  //    Timer.periodic(
  //         const Duration(
  //           seconds: 1,
  //         ),
  //         (a) {

  //         });
  //   }
  // }

  Duration timeRemaining = Duration.zero;
  Stream<Duration>? getTimeElapsed({
    required String? datetime,
    required String? duration,
  }) {
    while (Helper.isExamRunning(
      datetime: datetime,
      duration: duration,
    )) {
      return Stream.periodic(const Duration(seconds: 1), (a) {
        final examfinishTime = DateTime.parse(datetime!)
            .add(Duration(minutes: int.parse(duration!)));
        return examfinishTime.difference(DateTime.now());
      });
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'Take Exam'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: CustomDecoratedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CourseTitleWidget(
                          title: widget.examData.title ?? '',
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TitleValueWidget(
                          title: 'Marks: ',
                          value: '${totalMarks()}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: CustomDecoratedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      StreamBuilder<Duration>(
                        stream: getTimeElapsed(
                          datetime: widget.examData.examSchedule,
                          duration: widget.examData.examDuration,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            if (snapshot.data?.isNegative == true) {
                              return const TitleValueWidget(
                                title: 'Time Remaining:',
                                value: 'Time Finished',
                              );
                            }
                            return TitleValueWidget(
                              title: 'Time Remaining:',
                              value: snapshot.data!
                                  .toString()
                                  .split('.')
                                  .first
                                  .padLeft(8, '0'),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const TitleValueWidget(
                        title: 'Question Completion:',
                        value: '',
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ValueListenableBuilder(
                        valueListenable: attemptNotifier,
                        builder: (context, _, __) {
                          return Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: List.generate(
                                widget.examData.questions?.length ?? 0,
                                (index) {
                              return SizedBox(
                                height: 25,
                                width: 25,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: questionIdSet.contains(
                                      widget.examData.questions![index].question
                                          ?.id,
                                    )
                                        ? AppColors.kPrimaryColor
                                        : AppColors.kWhiteColor,
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: questionIdSet.contains(
                                          widget.examData.questions![index]
                                              .question?.id,
                                        )
                                            ? AppColors.kWhiteColor
                                            : AppColors.kTextPrimaryColor,
                                        fontFeatures: const [
                                          FontFeature.tabularFigures()
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Question ${index + 1}',
                              style: const TextStyle(
                                fontFamily: AppStyles.kFontOpenSans,
                                fontSize: 14,
                                color: AppColors.kTextPrimaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              '1 Marks',
                              style: TextStyle(
                                fontFamily: AppStyles.kFontOpenSans,
                                fontSize: 14,
                                color: AppColors.kTextPrimaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        HtmlWidget(
                          postContent: widget.examData.questions![index]
                                  .question?.question ??
                              '',
                        ),
                        MyRadioList(
                          index: index,
                          questionData: widget.examData.questions![index],
                          selectedValue: questionAnswer[
                              widget.examData.questions![index].question?.id],
                          callBack: (id, answer) {
                            questionIdSet.add(id);
                            questionAnswer.update(
                              id,
                              (value) => answer,
                              ifAbsent: () => answer,
                            );

                            attemptNotifier.value = !attemptNotifier.value;
                          },
                        )
                      ],
                    ),
                  );
                },
                childCount: widget.examData.questions?.length ?? 0,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.2.sw,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ExamResultPage(
                            examData: widget.examData,
                            questionId: questionIdSet,
                            questionAnswer: questionAnswer,
                            email: widget.email,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text('Show Result'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyRadioList extends StatefulWidget {
  const MyRadioList({
    super.key,
    required this.questionData,
    required this.index,
    required this.callBack,
    this.selectedValue,
  });

  final Question questionData;
  final int index;
  final String? selectedValue;

  final void Function(int id, String answer) callBack;

  @override
  State<MyRadioList> createState() => _MyRadioListState();
}

class _MyRadioListState extends State<MyRadioList> {
  String? groupValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRadioTile(
          groupValue: groupValue ?? widget.selectedValue,
          value: widget.questionData.question?.answer1 ?? '',
          questionId: widget.questionData.question!.id!,
          onPressed: (id) {
            widget.callBack(id, widget.questionData.question?.answer1 ?? '');

            setState(() {
              groupValue = widget.questionData.question?.answer1 ?? '';
            });
          },
        ),
        const SizedBox(
          height: 5,
        ),
        CustomRadioTile(
          groupValue: groupValue ?? widget.selectedValue,
          value: widget.questionData.question?.answer2 ?? '',
          questionId: widget.questionData.question!.id!,
          onPressed: (id) {
            widget.callBack(id, widget.questionData.question?.answer2 ?? '');

            setState(() {
              groupValue = widget.questionData.question?.answer2 ?? '';
            });
          },
        ),
        const SizedBox(
          height: 5,
        ),
        CustomRadioTile(
          groupValue: groupValue ?? widget.selectedValue,
          value: widget.questionData.question?.answer3 ?? '',
          questionId: widget.questionData.question!.id!,
          onPressed: (id) {
            widget.callBack(id, widget.questionData.question?.answer3 ?? '');

            setState(() {
              groupValue = widget.questionData.question?.answer3 ?? '';
            });
          },
        ),
        const SizedBox(
          height: 5,
        ),
        CustomRadioTile(
          groupValue: groupValue ?? widget.selectedValue,
          value: widget.questionData.question?.answer4 ?? '',
          questionId: widget.questionData.question!.id!,
          onPressed: (id) {
            widget.callBack(id, widget.questionData.question?.answer4 ?? '');

            setState(() {
              groupValue = widget.questionData.question?.answer4 ?? '';
            });
          },
        ),
      ],
    );
  }
}

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    required this.value,
    required this.onPressed,
    required this.questionId,
    required this.groupValue,
  });

  final String value;
  final String? groupValue;
  final int questionId;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDecoratedBox(
      color: value == groupValue ? AppColors.kPrimaryColor : Colors.white,
      borderColor: Colors.transparent,
      child: RadioListTile(
        value: value,
        onChanged: (val) {
          onPressed(questionId);
        },
        selected: true,
        dense: true,
        activeColor: AppColors.kWhiteColor,
        groupValue: groupValue,
        title: Text(
          value,
          style: const TextStyle(
            color: AppColors.kTextPrimaryColor,
            fontSize: 14,
            fontFamily: AppStyles.kMonoSerrat,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
