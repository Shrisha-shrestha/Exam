import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:creatu_exam/core/di/dependency_injections.dart';
import 'package:creatu_exam/core/helper/helper.dart';
import 'package:creatu_exam/features/exams/data/models/exam_model.dart';
import 'package:creatu_exam/features/exams/data/models/result_submit_model.dart';
import 'package:creatu_exam/features/exams/data/models/save_result_drift_model.dart'
    as database;
import 'package:creatu_exam/features/exams/presentation/widgets/custom_title_value.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/html_widget.dart';
import 'package:drift/drift.dart' as df;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TakeExamPageView extends StatefulWidget {
  const TakeExamPageView({
    super.key,
    required this.examData,
    required this.email,
  });

  final ExamModel examData;
  final String email;

  @override
  State<TakeExamPageView> createState() => _TakeExamPageViewState();
}

class _TakeExamPageViewState extends State<TakeExamPageView> {
  int totalMarks = 0;
  int marksPerQuestions = 1;
  Future<Map<String, dynamic>> getMyResult() async {
    var count = 0;
    totalMarks = 0;

    final stringToBase64 = utf8.fuse(base64);

    final questionAnswered = await getIt<database.MyExamDatabase>()
        .forResultCalculation(widget.examData.id!);

    for (final e in questionAnswered) {
      final data = widget.examData.questions
          ?.firstWhereOrNull((element) => element.question?.id == e.questionId);
      if (data != null) {
        final base64ToStringQues =
            stringToBase64.decode(data.question?.key ?? '');
        final requiredNotation = base64ToStringQues.split('-')[1];

        if (requiredNotation == 'al' &&
            e.correctAnswer == data.question?.answer1) {
          count++;
          totalMarks += marksPerQuestions;
        } else if (requiredNotation == 'bi' &&
            e.correctAnswer == data.question?.answer2) {
          count++;
          totalMarks += marksPerQuestions;
        } else if (requiredNotation == 'ga' &&
            e.correctAnswer == data.question?.answer3) {
          count++;
          totalMarks += marksPerQuestions;
        } else if (requiredNotation == 'th' &&
            e.correctAnswer == data.question?.answer4) {
          count++;
          totalMarks += marksPerQuestions;
        }
      }
    }

    final result = ResultSubmitModel(
      examId: widget.examData.id,
      fullMark: (widget.examData.questions ?? []).length,
      obtainedMark: totalMarks,
      totalRightAnswer: count,
      totalWrongAnswer: (widget.examData.questions ?? []).length - count,
      result: questionAnswered
          .map(
            (e) => Result(
              answer1: e.answer1,
              answer2: e.answer2,
              answer3: e.answer3,
              answer4: e.answer4,
              selectedAnswer: e.correctAnswer,
              question: e.question,
              questionId: e.questionId,
            ),
          )
          .toList(),
    );
    log('${result.toJson()}');
    return result.toJson();
  }

  late final PageController _pageController;
  late final ScrollController _gridScrollController;
  final ScrollController _radioTilesScrollController = ScrollController();

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
    _pageController = PageController();
    _gridScrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: CustomAppBar(title: widget.examData.title ?? ''),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     final p = await getIt<database.MyExamDatabase>()
            //         .deleteAnsweredQuestions();
            //   },
            //   child: const Text('Test Delete'),
            // ),
            SizedBox(
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
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
                        StreamBuilder<List<int>>(
                          stream: getIt<database.MyExamDatabase>()
                              .getQuestionIdList(
                            widget.examData.id!,
                          ),
                          builder: (context, s) {
                            return Scrollbar(
                              thumbVisibility: true,
                              controller: _gridScrollController,
                              child: SizedBox(
                                height: 110,
                                child: GridView.builder(
                                  controller: _gridScrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      (widget.examData.questions ?? []).length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        if (_pageController.hasClients) {
                                          _pageController.jumpToPage(
                                            index,
                                          );
                                        }
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: (s.data ?? []).contains(
                                            widget.examData.questions![index]
                                                .question?.id,
                                          )
                                              ? AppColors.kPrimaryColor
                                              : AppColors.kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                            color: AppColors.kPrimaryColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                              color: (s.data ?? []).contains(
                                                widget
                                                    .examData
                                                    .questions![index]
                                                    .question
                                                    ?.id,
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
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 0.6.sh,
              child: PageView.builder(
                allowImplicitScrolling: true,
                controller: _pageController,
                itemCount: (widget.examData.questions ?? []).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomDecoratedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kPrimaryColor,
                                    minimumSize: Size.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 15,
                                    ),
                                  ),
                                  onPressed: index > 0
                                      ? () {
                                          if (index > 0) {
                                            _pageController.animateToPage(
                                              index - 1,
                                              duration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              curve: Curves.easeIn,
                                            );
                                          }
                                        }
                                      : null,
                                  child: const Text(
                                    'Previous',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppStyles.kFontOpenSans,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kPrimaryColor,
                                    minimumSize: Size.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (index + 1 <
                                        (widget.examData.questions ?? [])
                                            .length) {
                                      _pageController.animateToPage(
                                        index + 1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppStyles.kFontOpenSans,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 1.sw,
                              height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color:
                                          AppColors.kGreyColor.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
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
                            Scrollbar(
                              controller: _radioTilesScrollController,
                              child: SingleChildScrollView(
                                controller: _radioTilesScrollController,
                                child: Column(
                                  children: [
                                    MyRadioList(
                                      examId: widget.examData.id!,
                                      index: index,
                                      questionData:
                                          widget.examData.questions![index],
                                      callBack: (id, answer) {
                                        // questionIdSet.add(id);
                                        // questionAnswer.update(
                                        //   id,
                                        //   (value) => answer,
                                        //   ifAbsent: () => answer,
                                        // );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(),
                            if (index + 1 ==
                                (widget.examData.questions ?? []).length)
                              Align(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kPrimaryColor,
                                    minimumSize: Size.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 15,
                                    ),
                                  ),
                                  onPressed: getMyResult,
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppStyles.kFontOpenSans,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
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
    required this.examId,
  });

  final Question questionData;

  final int examId;
  final int index;
  final String? selectedValue;

  final void Function(int id, String answer) callBack;

  @override
  State<MyRadioList> createState() => _MyRadioListState();
}

class _MyRadioListState extends State<MyRadioList> {
  String? groupValue;

  Future<int> storeToLocalDb({required String? userAnswer}) {
    return getIt<database.MyExamDatabase>().insertOrUpdateAnswer(
      database.QuestionsCompanion(
        questionId: df.Value(widget.questionData.question!.id!),
        examId: df.Value(widget.examId),
        answer1: df.Value(widget.questionData.question?.answer1),
        answer2: df.Value(widget.questionData.question?.answer2),
        answer3: df.Value(widget.questionData.question?.answer3),
        answer4: df.Value(widget.questionData.question?.answer4),
        key: df.Value(widget.questionData.question?.key),
        correctAnswer: df.Value(userAnswer),
        question: df.Value(widget.questionData.question?.question),
        questionSetId: df.Value(widget.questionData.setId),
        createdAt:
            df.Value(widget.questionData.question?.createdAt?.toString()),
        updatedAt:
            df.Value(widget.questionData.question?.updatedAt?.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<database.Question>>(
      stream:
          getIt<database.MyExamDatabase>().getAllAnswerForSet(widget.examId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          log('{snapshot.data}');
          log('${snapshot.data}');
          return Column(
            children: [
              CustomRadioTile(
                groupValue: snapshot.data
                    ?.firstWhereOrNull(
                      (element) =>
                          element.questionId ==
                          widget.questionData.question!.id,
                    )
                    ?.correctAnswer,
                value: widget.questionData.question?.answer1 ?? '',
                questionId: widget.questionData.question!.id!,
                onPressed: (id) async {
                  widget.callBack(
                    id,
                    widget.questionData.question?.answer1 ?? '',
                  );

                  setState(() {
                    groupValue = widget.questionData.question?.answer1 ?? '';
                  });
                  await storeToLocalDb(
                    userAnswer: widget.questionData.question?.answer1,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomRadioTile(
                groupValue: snapshot.data
                    ?.firstWhereOrNull(
                      (element) =>
                          element.questionId ==
                          widget.questionData.question!.id,
                    )
                    ?.correctAnswer,
                value: widget.questionData.question?.answer2 ?? '',
                questionId: widget.questionData.question!.id!,
                onPressed: (id) async {
                  widget.callBack(
                    id,
                    widget.questionData.question?.answer2 ?? '',
                  );

                  setState(() {
                    groupValue = widget.questionData.question?.answer2 ?? '';
                  });
                  await storeToLocalDb(
                    userAnswer: widget.questionData.question?.answer2,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomRadioTile(
                groupValue: snapshot.data
                    ?.firstWhereOrNull(
                      (element) =>
                          element.questionId ==
                          widget.questionData.question!.id,
                    )
                    ?.correctAnswer,
                value: widget.questionData.question?.answer3 ?? '',
                questionId: widget.questionData.question!.id!,
                onPressed: (id) async {
                  widget.callBack(
                    id,
                    widget.questionData.question?.answer3 ?? '',
                  );

                  setState(() {
                    groupValue = widget.questionData.question?.answer3 ?? '';
                  });
                  await storeToLocalDb(
                    userAnswer: widget.questionData.question?.answer3,
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              CustomRadioTile(
                groupValue: snapshot.data
                    ?.firstWhereOrNull(
                      (element) =>
                          element.questionId ==
                          widget.questionData.question!.id,
                    )
                    ?.correctAnswer,
                value: widget.questionData.question?.answer4 ?? '',
                questionId: widget.questionData.question!.id!,
                onPressed: (id) async {
                  // widget.callBack(
                  //     id, widget.questionData.question?.answer4 ?? '');

                  setState(() {
                    groupValue = widget.questionData.question?.answer4 ?? '';
                  });
                  await storeToLocalDb(
                    userAnswer: widget.questionData.question?.answer4,
                  );
                },
              ),
            ],
          );
        }
        return const SizedBox();
      },
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
      borderColor: Colors.grey.withOpacity(0.3),
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
