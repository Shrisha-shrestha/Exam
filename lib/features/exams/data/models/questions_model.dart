import 'package:equatable/equatable.dart';

class QuestionsModel extends Equatable {
  final DateTime? updatedAt;
  final String? question;
  final int? parentId;
  final String? answer3;
  final DateTime? createdAt;
  final String? answer2;
  final int? id;
  final int? topicId;
  final String? answer4;
  final String? answerExpln;
  final String? key;
  final String? answer1;

  const QuestionsModel({
    this.updatedAt,
    this.question,
    this.parentId,
    this.answer3,
    this.createdAt,
    this.answer2,
    this.id,
    this.topicId,
    this.answer4,
    this.answerExpln,
    this.key,
    this.answer1,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      question: json['question'] as String?,
      parentId: json['parent_id'] as int?,
      answer3: json['answer3'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      answer2: json['answer2'] as String?,
      id: json['id'] as int?,
      topicId: json['topic_id'] as int?,
      answer4: json['answer4'] as String?,
      answerExpln: json['answer_expln'] as String?,
      key: json['key'] as String?,
      answer1: json['answer1'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'updated_at': updatedAt?.toIso8601String(),
        'question': question,
        'parent_id': parentId,
        'answer3': answer3,
        'created_at': createdAt?.toIso8601String(),
        'answer2': answer2,
        'id': id,
        'topic_id': topicId,
        'answer4': answer4,
        'answer_expln': answerExpln,
        'key': key,
        'answer1': answer1,
      };

  @override
  List<Object?> get props {
    return [
      updatedAt,
      question,
      parentId,
      answer3,
      createdAt,
      answer2,
      id,
      topicId,
      answer4,
      answerExpln,
      key,
      answer1,
    ];
  }
}
