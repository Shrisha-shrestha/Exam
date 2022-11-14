import 'package:creatu_exam/features/exams/data/models/questions_model.dart';
import 'package:equatable/equatable.dart';

class ExamModel extends Equatable {
  const ExamModel({
    this.informationVideo,
    this.thumbnail,
    this.questionSetId,
    this.format,
    this.examSchedule,
    this.questions,
    this.examDuration,
    this.description,
    this.id,
    this.title,
    this.status,
    this.registeredUser,
  });
  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
        informationVideo: json['information_video'] as String?,
        thumbnail: json['thumbnail'] as String?,
        questionSetId: json['question_set_id'] as String?,
        format: json['format'] as String?,
        examSchedule: json['exam_schedule'] as String?,
        questions: (json['questions'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList(),
        registeredUser: (json['registered_users'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        examDuration: json['exam_duration'] as String?,
        description: json['description'] as String?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        status: json['status'] as String?,
      );
  final String? informationVideo;
  final String? thumbnail;
  final String? questionSetId;
  final String? format;
  final String? examSchedule;
  final List<Question>? questions;
  final List<String>? registeredUser;
  final String? examDuration;
  final String? description;
  final int? id;
  final String? title;
  final String? status;

  Map<String, dynamic> toJson() => {
        'information_video': informationVideo,
        'thumbnail': thumbnail,
        'question_set_id': questionSetId,
        'format': format,
        'exam_schedule': examSchedule,
        'questions': questions?.map((e) => e.toJson()).toList(),
        'exam_duration': examDuration,
        'description': description,
        'id': id,
        'title': title,
        'status': status,
      };

  @override
  List<Object?> get props {
    return [
      informationVideo,
      thumbnail,
      questionSetId,
      format,
      examSchedule,
      questions,
      examDuration,
      description,
      id,
      title,
      status,
    ];
  }
}

class Question extends Equatable {
  const Question({
    this.updatedAt,
    this.question,
    this.createdAt,
    this.setId,
    this.id,
    this.questionId,
  });
  factory Question.fromJson(Map<String, dynamic> json) => Question(
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        question: json['question'] == null
            ? null
            : QuestionsModel.fromJson(json['question'] as Map<String, dynamic>),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        setId: json['set_id'] as int?,
        id: json['id'] as int?,
        questionId: json['question_id'] as int?,
      );
  final DateTime? updatedAt;
  final QuestionsModel? question;
  final DateTime? createdAt;
  final int? setId;
  final int? id;
  final int? questionId;

  Map<String, dynamic> toJson() => {
        'updated_at': updatedAt?.toIso8601String(),
        'question': question,
        'created_at': createdAt?.toIso8601String(),
        'set_id': setId,
        'id': id,
        'question_id': questionId,
      };

  @override
  List<Object?> get props {
    return [
      updatedAt,
      question,
      createdAt,
      setId,
      id,
      questionId,
    ];
  }
}
