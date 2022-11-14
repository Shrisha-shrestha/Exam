import 'package:equatable/equatable.dart';

class ResultSubmitModel extends Equatable {
  final int? examId;
  final int? fullMark;
  final int? passMark;
  final int? obtainedMark;
  final int? totalRightAnswer;
  final int? totalWrongAnswer;
  final List<Result>? result;

  const ResultSubmitModel({
    this.examId,
    this.fullMark,
    this.passMark,
    this.obtainedMark,
    this.totalRightAnswer,
    this.totalWrongAnswer,
    this.result,
  });

  factory ResultSubmitModel.fromJson(Map<String, dynamic> json) {
    return ResultSubmitModel(
      examId: json['exam_id'] as int?,
      fullMark: json['full_mark'] as int?,
      passMark: json['pass_mark'] as int?,
      obtainedMark: json['obtained_mark'] as int?,
      totalRightAnswer: json['total_right_answer'] as int?,
      totalWrongAnswer: json['total_wrong_answer'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'exam_id': examId,
        'full_mark': fullMark,
        'pass_mark': passMark,
        'obtained_mark': obtainedMark,
        'total_right_answer': totalRightAnswer,
        'total_wrong_answer': totalWrongAnswer,
        'result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      examId,
      fullMark,
      passMark,
      obtainedMark,
      totalRightAnswer,
      totalWrongAnswer,
      result,
    ];
  }
}

class Result extends Equatable {
  final String? answer1;
  final String? answer2;
  final String? answer3;
  final String? answer4;
  final String? key;
  final String? question;
  final String? selectedAnswer;
  final int? questionId;

  const Result({
    this.answer1,
    this.answer2,
    this.answer3,
    this.answer4,
    this.key,
    this.question,
    this.selectedAnswer,
    this.questionId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        answer1: json['answer1'] as String?,
        answer2: json['answer2'] as String?,
        answer3: json['answer3'] as String?,
        answer4: json['answer4'] as String?,
        key: json['key'] as String?,
        question: json['question'] as String?,
        selectedAnswer: json['selected_answer'] as String?,
        questionId: json['question_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'answer1': answer1,
        'answer2': answer2,
        'answer3': answer3,
        'answer4': answer4,
        'key': key,
        'question': question,
        'selected_answer': selectedAnswer,
        'question_id': questionId,
      };

  @override
  List<Object?> get props {
    return [
      answer1,
      answer2,
      answer3,
      answer4,
      key,
      question,
      selectedAnswer,
      questionId,
    ];
  }
}
