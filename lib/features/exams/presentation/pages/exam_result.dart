import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:creatu_exam/features/exams/data/models/exam_model.dart';
import 'package:creatu_exam/features/exams/presentation/widgets/custom_title_value.dart';
import 'package:creatu_exam/res/app_colors.dart';
import 'package:creatu_exam/res/app_styles.dart';
import 'package:creatu_exam/widgets/custom_appbar.dart';
import 'package:creatu_exam/widgets/custom_decoratedbox.dart';
import 'package:creatu_exam/widgets/html_widget.dart';
import 'package:creatu_exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ExamResultPage extends StatefulWidget {
  const ExamResultPage({
    super.key,
    required this.examData,
    required this.questionId,
    required this.questionAnswer,
    required this.email,
  });

  final ExamModel examData;
  final Set<int> questionId;
  final String email;

  final Map<int, String?> questionAnswer;

  @override
  State<ExamResultPage> createState() => _ExamResultPageState();
}

class _ExamResultPageState extends State<ExamResultPage> {
  @override
  void initState() {
    super.initState();

    correctAnswer();
    _setPath();
  }

  late final String path;

  Future<void> _setPath() async {
    await Permission.storage.request();

    if (Platform.isAndroid) {
      //TODO NEEDED to impelment manage external storage
      // final direcotry = Directory('storage/emulated/0/creatu_exam');
      // if (await direcotry.exists()) {
      //   path = direcotry.path;
      // } else {
      //   await direcotry.create();
      //   path = direcotry.path;
      // }
      path = (await getExternalStorageDirectory())?.path ?? '';
    } else if (Platform.isIOS) {
      path = (await getApplicationDocumentsDirectory()).path;
    }
  }

  int totalMarks = 0;
  int marksPerQuestions = 0;
  double negativeMarking = 0;
  int correctAnswer() {
    var count = 0;
    totalMarks = 0;
    if (widget.examData.format == 'type2') {
      marksPerQuestions = 2;
    } else {
      marksPerQuestions = 1;
    }

    final stringToBase64 = utf8.fuse(base64);

    widget.questionAnswer.forEach((id, value) {
      final data = widget.examData.questions
          ?.firstWhereOrNull((element) => element.question?.id == id);
      if (data != null) {
        final base64ToStringQues =
            stringToBase64.decode(data.question?.key ?? '');
        final requiredNotation = base64ToStringQues.split('-')[1];

        if (requiredNotation == 'al' && value == data.question?.answer1) {
          count++;
          totalMarks += marksPerQuestions;
        } else if (requiredNotation == 'bi' &&
            value == data.question?.answer2) {
          count++;
          totalMarks += marksPerQuestions;
        } else if (requiredNotation == 'ga' &&
            value == data.question?.answer3) {
          count++;
          totalMarks += marksPerQuestions;
        } else if (requiredNotation == 'th' &&
            value == data.question?.answer4) {
          count++;
          totalMarks += marksPerQuestions;
        }
      }
    });
    negativeMarking =
        (widget.questionId.length - count) * marksPerQuestions * 0.2;

    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'Exam Result'),
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
                          title: 'Marks Obtained: ',
                          value:
                              '${(totalMarks - negativeMarking).toStringAsFixed(2)} ',
                        ),
                        TitleValueWidget(
                          title: 'Total Answered Questions',
                          value: '${widget.questionId.length}',
                        ),
                        TitleValueWidget(
                          title: 'Total Correct Answers',
                          value: '${correctAnswer()}',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor,
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                          ),
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return PdfPreview(
                            //       canChangePageFormat: false,
                            //       canDebug: false,
                            //       canChangeOrientation: false,
                            //       actions: [
                            //         IconButton(
                            //           onPressed: () async {
                            //             final doc = await generateShortResult(
                            //               data: widget.examData,
                            //               format: PdfPageFormat.a4,
                            //               userProfile: getIt<
                            //                           Box<UserHiveModel>>()
                            //                       .get('user')
                            //                       ?.image ??
                            //                   'https://www.w3schools.com/howto/img_avatar.png',
                            //               totalCorrect: correctAnswer(),
                            //               questionAnswer: widget.questionAnswer,
                            //               totalMarks: marksPerQuestions *
                            //                   (widget.examData.questions
                            //                           ?.length ??
                            //                       0),
                            //               marksObtained:
                            //                   (totalMarks - negativeMarking)
                            //                       .toStringAsFixed(2),
                            //               email: widget.email,
                            //             );
                            //             // final output =
                            //             // await getTemporaryDirectory();
                            //             print('output');
                            //             final file = File(
                            //               '$path/creatu_exam-${DateTime.now().microsecondsSinceEpoch}.pdf',
                            //             );
                            //             print(file.path);
                            //             print(await file.writeAsBytes(doc));
                            //           },
                            //           icon: const Icon(
                            //             Icons.download,
                            //           ),
                            //         )
                            //       ],
                            //       pdfFileName:
                            //           '${widget.examData.title}${DateTime.now()}',
                            //       build: (format) => generateShortResult(
                            //         data: widget.examData,
                            //         format: PdfPageFormat.a4,
                            //         userProfile: getIt<Box<UserHiveModel>>()
                            //                 .get('user')
                            //                 ?.image ??
                            //             'https://www.w3schools.com/howto/img_avatar.png',
                            //         totalCorrect: correctAnswer(),
                            //         questionAnswer: widget.questionAnswer,
                            //         totalMarks: marksPerQuestions *
                            //             (widget.examData.questions?.length ??
                            //                 0),
                            //         marksObtained:
                            //             (totalMarks - negativeMarking)
                            //                 .toStringAsFixed(2),
                            //         email: widget.email,
                            //       ),
                            //     );

                            //   },
                            // );
                          },
                          child: const Text('Download Result'),
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
                      TitleValueWidget(
                        title: 'Full Time:',
                        value: widget.examData.examDuration ?? '',
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
                      Wrap(
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
                                  color: widget.questionId.contains(
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
                                      color: widget.questionId.contains(
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
                          },
                        ),
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
                            Text(
                              widget.examData.format == 'type2'
                                  ? '2 Marks'
                                  : '1 Marks',
                              style: const TextStyle(
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
                        if (!widget.questionId.contains(
                          widget.examData.questions![index].question?.id,
                        ))
                          const Padding(
                            padding: EdgeInsets.only(
                              bottom: 5,
                            ),
                            child: Text(
                              'This question was not answered',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppStyles.kFontOpenSans,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        MyRadioList(
                          index: index,
                          questionData: widget.examData.questions![index],
                          selectedAnswer: widget.questionAnswer[
                              widget.examData.questions![index].question?.id],
                        )
                      ],
                    ),
                  );
                },
                childCount: widget.examData.questions?.length ?? 0,
              ),
            ),
          )
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
    required this.selectedAnswer,
  });

  final Question questionData;
  final String? selectedAnswer;
  final int index;

  @override
  State<MyRadioList> createState() => _MyRadioListState();
}

class _MyRadioListState extends State<MyRadioList> {
  String? decodeCorrectOption(String? key, Question answer) {
    final decode = utf8.decode(base64.decode(key ?? ''));
    if (decode.split('-')[1] == 'al') {
      return answer.question?.answer1;
    } else if (decode.split('-')[1] == 'bi') {
      return answer.question?.answer2;
    } else if (decode.split('-')[1] == 'ga') {
      return answer.question?.answer3;
    } else if (decode.split('-')[1] == 'th') {
      return answer.question?.answer4;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRadioTile(
          selectedAnswer: widget.selectedAnswer,
          groupValue: decodeCorrectOption(
            widget.questionData.question?.key,
            widget.questionData,
          ),
          value: widget.questionData.question?.answer1 ?? '',
          questionId: widget.questionData.question!.id!,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomRadioTile(
          selectedAnswer: widget.selectedAnswer,
          groupValue: decodeCorrectOption(
            widget.questionData.question?.key,
            widget.questionData,
          ),
          value: widget.questionData.question?.answer2 ?? '',
          questionId: widget.questionData.question!.id!,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomRadioTile(
          selectedAnswer: widget.selectedAnswer,
          groupValue: decodeCorrectOption(
            widget.questionData.question?.key,
            widget.questionData,
          ),
          value: widget.questionData.question?.answer3 ?? '',
          questionId: widget.questionData.question!.id!,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomRadioTile(
          selectedAnswer: widget.selectedAnswer,
          groupValue: decodeCorrectOption(
            widget.questionData.question?.key,
            widget.questionData,
          ),
          value: widget.questionData.question?.answer4 ?? '',
          questionId: widget.questionData.question!.id!,
        ),
      ],
    );
  }
}

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    required this.value,
    required this.questionId,
    required this.groupValue,
    required this.selectedAnswer,
  });

  final String value;
  final String? groupValue;
  final int questionId;
  final String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return CustomDecoratedBox(
      color: value == groupValue
          ? AppColors.kPrimaryColor
          : selectedAnswer == value
              ? Colors.red
              : Colors.white,
      borderColor: Colors.transparent,
      child: RadioListTile(
        value: value,
        onChanged: (val) {},
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
