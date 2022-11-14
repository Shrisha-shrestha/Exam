// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_result_drift_model.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Exam extends DataClass implements Insertable<Exam> {
  final int id;
  final String examId;
  final String? createdAt;
  final String? title;
  final String? status;
  final String? thumbnail;
  final String? questionsSetId;
  final String? informationVideo;
  const Exam(
      {required this.id,
      required this.examId,
      this.createdAt,
      this.title,
      this.status,
      this.thumbnail,
      this.questionsSetId,
      this.informationVideo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['exam_id'] = Variable<String>(examId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || questionsSetId != null) {
      map['questions_set_id'] = Variable<String>(questionsSetId);
    }
    if (!nullToAbsent || informationVideo != null) {
      map['information_video'] = Variable<String>(informationVideo);
    }
    return map;
  }

  ExamsCompanion toCompanion(bool nullToAbsent) {
    return ExamsCompanion(
      id: Value(id),
      examId: Value(examId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      questionsSetId: questionsSetId == null && nullToAbsent
          ? const Value.absent()
          : Value(questionsSetId),
      informationVideo: informationVideo == null && nullToAbsent
          ? const Value.absent()
          : Value(informationVideo),
    );
  }

  factory Exam.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exam(
      id: serializer.fromJson<int>(json['id']),
      examId: serializer.fromJson<String>(json['examId']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      title: serializer.fromJson<String?>(json['title']),
      status: serializer.fromJson<String?>(json['status']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      questionsSetId: serializer.fromJson<String?>(json['questionsSetId']),
      informationVideo: serializer.fromJson<String?>(json['informationVideo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'examId': serializer.toJson<String>(examId),
      'createdAt': serializer.toJson<String?>(createdAt),
      'title': serializer.toJson<String?>(title),
      'status': serializer.toJson<String?>(status),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'questionsSetId': serializer.toJson<String?>(questionsSetId),
      'informationVideo': serializer.toJson<String?>(informationVideo),
    };
  }

  Exam copyWith(
          {int? id,
          String? examId,
          Value<String?> createdAt = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> thumbnail = const Value.absent(),
          Value<String?> questionsSetId = const Value.absent(),
          Value<String?> informationVideo = const Value.absent()}) =>
      Exam(
        id: id ?? this.id,
        examId: examId ?? this.examId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        title: title.present ? title.value : this.title,
        status: status.present ? status.value : this.status,
        thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
        questionsSetId:
            questionsSetId.present ? questionsSetId.value : this.questionsSetId,
        informationVideo: informationVideo.present
            ? informationVideo.value
            : this.informationVideo,
      );
  @override
  String toString() {
    return (StringBuffer('Exam(')
          ..write('id: $id, ')
          ..write('examId: $examId, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('questionsSetId: $questionsSetId, ')
          ..write('informationVideo: $informationVideo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, examId, createdAt, title, status,
      thumbnail, questionsSetId, informationVideo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exam &&
          other.id == this.id &&
          other.examId == this.examId &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.status == this.status &&
          other.thumbnail == this.thumbnail &&
          other.questionsSetId == this.questionsSetId &&
          other.informationVideo == this.informationVideo);
}

class ExamsCompanion extends UpdateCompanion<Exam> {
  final Value<int> id;
  final Value<String> examId;
  final Value<String?> createdAt;
  final Value<String?> title;
  final Value<String?> status;
  final Value<String?> thumbnail;
  final Value<String?> questionsSetId;
  final Value<String?> informationVideo;
  const ExamsCompanion({
    this.id = const Value.absent(),
    this.examId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.questionsSetId = const Value.absent(),
    this.informationVideo = const Value.absent(),
  });
  ExamsCompanion.insert({
    this.id = const Value.absent(),
    required String examId,
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.questionsSetId = const Value.absent(),
    this.informationVideo = const Value.absent(),
  }) : examId = Value(examId);
  static Insertable<Exam> custom({
    Expression<int>? id,
    Expression<String>? examId,
    Expression<String>? createdAt,
    Expression<String>? title,
    Expression<String>? status,
    Expression<String>? thumbnail,
    Expression<String>? questionsSetId,
    Expression<String>? informationVideo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (examId != null) 'exam_id': examId,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (questionsSetId != null) 'questions_set_id': questionsSetId,
      if (informationVideo != null) 'information_video': informationVideo,
    });
  }

  ExamsCompanion copyWith(
      {Value<int>? id,
      Value<String>? examId,
      Value<String?>? createdAt,
      Value<String?>? title,
      Value<String?>? status,
      Value<String?>? thumbnail,
      Value<String?>? questionsSetId,
      Value<String?>? informationVideo}) {
    return ExamsCompanion(
      id: id ?? this.id,
      examId: examId ?? this.examId,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      status: status ?? this.status,
      thumbnail: thumbnail ?? this.thumbnail,
      questionsSetId: questionsSetId ?? this.questionsSetId,
      informationVideo: informationVideo ?? this.informationVideo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<String>(examId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (questionsSetId.present) {
      map['questions_set_id'] = Variable<String>(questionsSetId.value);
    }
    if (informationVideo.present) {
      map['information_video'] = Variable<String>(informationVideo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamsCompanion(')
          ..write('id: $id, ')
          ..write('examId: $examId, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('questionsSetId: $questionsSetId, ')
          ..write('informationVideo: $informationVideo')
          ..write(')'))
        .toString();
  }
}

class $ExamsTable extends Exams with TableInfo<$ExamsTable, Exam> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<String> examId = GeneratedColumn<String>(
      'exam_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _thumbnailMeta = const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _questionsSetIdMeta =
      const VerificationMeta('questionsSetId');
  @override
  late final GeneratedColumn<String> questionsSetId = GeneratedColumn<String>(
      'questions_set_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _informationVideoMeta =
      const VerificationMeta('informationVideo');
  @override
  late final GeneratedColumn<String> informationVideo = GeneratedColumn<String>(
      'information_video', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        examId,
        createdAt,
        title,
        status,
        thumbnail,
        questionsSetId,
        informationVideo
      ];
  @override
  String get aliasedName => _alias ?? 'exams';
  @override
  String get actualTableName => 'exams';
  @override
  VerificationContext validateIntegrity(Insertable<Exam> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('exam_id')) {
      context.handle(_examIdMeta,
          examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta));
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    if (data.containsKey('questions_set_id')) {
      context.handle(
          _questionsSetIdMeta,
          questionsSetId.isAcceptableOrUnknown(
              data['questions_set_id']!, _questionsSetIdMeta));
    }
    if (data.containsKey('information_video')) {
      context.handle(
          _informationVideoMeta,
          informationVideo.isAcceptableOrUnknown(
              data['information_video']!, _informationVideoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exam map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exam(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      examId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}exam_id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      status: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      thumbnail: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail']),
      questionsSetId: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}questions_set_id']),
      informationVideo: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}information_video']),
    );
  }

  @override
  $ExamsTable createAlias(String alias) {
    return $ExamsTable(attachedDatabase, alias);
  }
}

class QuestionSet extends DataClass implements Insertable<QuestionSet> {
  final int id;
  final int setId;
  final String examId;
  final String? createdAt;
  const QuestionSet(
      {required this.id,
      required this.setId,
      required this.examId,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['set_id'] = Variable<int>(setId);
    map['exam_id'] = Variable<String>(examId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  QuestionSetsCompanion toCompanion(bool nullToAbsent) {
    return QuestionSetsCompanion(
      id: Value(id),
      setId: Value(setId),
      examId: Value(examId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory QuestionSet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionSet(
      id: serializer.fromJson<int>(json['id']),
      setId: serializer.fromJson<int>(json['setId']),
      examId: serializer.fromJson<String>(json['examId']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'setId': serializer.toJson<int>(setId),
      'examId': serializer.toJson<String>(examId),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  QuestionSet copyWith(
          {int? id,
          int? setId,
          String? examId,
          Value<String?> createdAt = const Value.absent()}) =>
      QuestionSet(
        id: id ?? this.id,
        setId: setId ?? this.setId,
        examId: examId ?? this.examId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('QuestionSet(')
          ..write('id: $id, ')
          ..write('setId: $setId, ')
          ..write('examId: $examId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, setId, examId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionSet &&
          other.id == this.id &&
          other.setId == this.setId &&
          other.examId == this.examId &&
          other.createdAt == this.createdAt);
}

class QuestionSetsCompanion extends UpdateCompanion<QuestionSet> {
  final Value<int> id;
  final Value<int> setId;
  final Value<String> examId;
  final Value<String?> createdAt;
  const QuestionSetsCompanion({
    this.id = const Value.absent(),
    this.setId = const Value.absent(),
    this.examId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  QuestionSetsCompanion.insert({
    this.id = const Value.absent(),
    required int setId,
    required String examId,
    this.createdAt = const Value.absent(),
  })  : setId = Value(setId),
        examId = Value(examId);
  static Insertable<QuestionSet> custom({
    Expression<int>? id,
    Expression<int>? setId,
    Expression<String>? examId,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (setId != null) 'set_id': setId,
      if (examId != null) 'exam_id': examId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  QuestionSetsCompanion copyWith(
      {Value<int>? id,
      Value<int>? setId,
      Value<String>? examId,
      Value<String?>? createdAt}) {
    return QuestionSetsCompanion(
      id: id ?? this.id,
      setId: setId ?? this.setId,
      examId: examId ?? this.examId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (setId.present) {
      map['set_id'] = Variable<int>(setId.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<String>(examId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionSetsCompanion(')
          ..write('id: $id, ')
          ..write('setId: $setId, ')
          ..write('examId: $examId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $QuestionSetsTable extends QuestionSets
    with TableInfo<$QuestionSetsTable, QuestionSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionSetsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedColumn<int> setId = GeneratedColumn<int>(
      'set_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<String> examId = GeneratedColumn<String>(
      'exam_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES exams (exam_id)');
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, setId, examId, createdAt];
  @override
  String get aliasedName => _alias ?? 'question_sets';
  @override
  String get actualTableName => 'question_sets';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('set_id')) {
      context.handle(
          _setIdMeta, setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta));
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    if (data.containsKey('exam_id')) {
      context.handle(_examIdMeta,
          examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta));
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionSet(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      setId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}set_id'])!,
      examId: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}exam_id'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $QuestionSetsTable createAlias(String alias) {
    return $QuestionSetsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final int id;
  final int? questionSetId;
  final int examId;
  final int examidQuestionid;
  final int questionId;
  final int? topicId;
  final String? updatedAt;
  final String? createdAt;
  final String? key;
  final String? question;
  final String? answer1;
  final String? answer2;
  final String? answer3;
  final String? answer4;
  final String? correctAnswer;
  const Question(
      {required this.id,
      this.questionSetId,
      required this.examId,
      required this.examidQuestionid,
      required this.questionId,
      this.topicId,
      this.updatedAt,
      this.createdAt,
      this.key,
      this.question,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.correctAnswer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || questionSetId != null) {
      map['question_set_id'] = Variable<int>(questionSetId);
    }
    map['exam_id'] = Variable<int>(examId);
    map['examid_questionid'] = Variable<int>(examidQuestionid);
    map['question_id'] = Variable<int>(questionId);
    if (!nullToAbsent || topicId != null) {
      map['topic_id'] = Variable<int>(topicId);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || key != null) {
      map['key'] = Variable<String>(key);
    }
    if (!nullToAbsent || question != null) {
      map['question'] = Variable<String>(question);
    }
    if (!nullToAbsent || answer1 != null) {
      map['answer1'] = Variable<String>(answer1);
    }
    if (!nullToAbsent || answer2 != null) {
      map['answer2'] = Variable<String>(answer2);
    }
    if (!nullToAbsent || answer3 != null) {
      map['answer3'] = Variable<String>(answer3);
    }
    if (!nullToAbsent || answer4 != null) {
      map['answer4'] = Variable<String>(answer4);
    }
    if (!nullToAbsent || correctAnswer != null) {
      map['correct_answer'] = Variable<String>(correctAnswer);
    }
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      questionSetId: questionSetId == null && nullToAbsent
          ? const Value.absent()
          : Value(questionSetId),
      examId: Value(examId),
      examidQuestionid: Value(examidQuestionid),
      questionId: Value(questionId),
      topicId: topicId == null && nullToAbsent
          ? const Value.absent()
          : Value(topicId),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      key: key == null && nullToAbsent ? const Value.absent() : Value(key),
      question: question == null && nullToAbsent
          ? const Value.absent()
          : Value(question),
      answer1: answer1 == null && nullToAbsent
          ? const Value.absent()
          : Value(answer1),
      answer2: answer2 == null && nullToAbsent
          ? const Value.absent()
          : Value(answer2),
      answer3: answer3 == null && nullToAbsent
          ? const Value.absent()
          : Value(answer3),
      answer4: answer4 == null && nullToAbsent
          ? const Value.absent()
          : Value(answer4),
      correctAnswer: correctAnswer == null && nullToAbsent
          ? const Value.absent()
          : Value(correctAnswer),
    );
  }

  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<int>(json['id']),
      questionSetId: serializer.fromJson<int?>(json['questionSetId']),
      examId: serializer.fromJson<int>(json['examId']),
      examidQuestionid: serializer.fromJson<int>(json['examidQuestionid']),
      questionId: serializer.fromJson<int>(json['questionId']),
      topicId: serializer.fromJson<int?>(json['topicId']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      key: serializer.fromJson<String?>(json['key']),
      question: serializer.fromJson<String?>(json['question']),
      answer1: serializer.fromJson<String?>(json['answer1']),
      answer2: serializer.fromJson<String?>(json['answer2']),
      answer3: serializer.fromJson<String?>(json['answer3']),
      answer4: serializer.fromJson<String?>(json['answer4']),
      correctAnswer: serializer.fromJson<String?>(json['correctAnswer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questionSetId': serializer.toJson<int?>(questionSetId),
      'examId': serializer.toJson<int>(examId),
      'examidQuestionid': serializer.toJson<int>(examidQuestionid),
      'questionId': serializer.toJson<int>(questionId),
      'topicId': serializer.toJson<int?>(topicId),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'createdAt': serializer.toJson<String?>(createdAt),
      'key': serializer.toJson<String?>(key),
      'question': serializer.toJson<String?>(question),
      'answer1': serializer.toJson<String?>(answer1),
      'answer2': serializer.toJson<String?>(answer2),
      'answer3': serializer.toJson<String?>(answer3),
      'answer4': serializer.toJson<String?>(answer4),
      'correctAnswer': serializer.toJson<String?>(correctAnswer),
    };
  }

  Question copyWith(
          {int? id,
          Value<int?> questionSetId = const Value.absent(),
          int? examId,
          int? examidQuestionid,
          int? questionId,
          Value<int?> topicId = const Value.absent(),
          Value<String?> updatedAt = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> key = const Value.absent(),
          Value<String?> question = const Value.absent(),
          Value<String?> answer1 = const Value.absent(),
          Value<String?> answer2 = const Value.absent(),
          Value<String?> answer3 = const Value.absent(),
          Value<String?> answer4 = const Value.absent(),
          Value<String?> correctAnswer = const Value.absent()}) =>
      Question(
        id: id ?? this.id,
        questionSetId:
            questionSetId.present ? questionSetId.value : this.questionSetId,
        examId: examId ?? this.examId,
        examidQuestionid: examidQuestionid ?? this.examidQuestionid,
        questionId: questionId ?? this.questionId,
        topicId: topicId.present ? topicId.value : this.topicId,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        key: key.present ? key.value : this.key,
        question: question.present ? question.value : this.question,
        answer1: answer1.present ? answer1.value : this.answer1,
        answer2: answer2.present ? answer2.value : this.answer2,
        answer3: answer3.present ? answer3.value : this.answer3,
        answer4: answer4.present ? answer4.value : this.answer4,
        correctAnswer:
            correctAnswer.present ? correctAnswer.value : this.correctAnswer,
      );
  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('questionSetId: $questionSetId, ')
          ..write('examId: $examId, ')
          ..write('examidQuestionid: $examidQuestionid, ')
          ..write('questionId: $questionId, ')
          ..write('topicId: $topicId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('key: $key, ')
          ..write('question: $question, ')
          ..write('answer1: $answer1, ')
          ..write('answer2: $answer2, ')
          ..write('answer3: $answer3, ')
          ..write('answer4: $answer4, ')
          ..write('correctAnswer: $correctAnswer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      questionSetId,
      examId,
      examidQuestionid,
      questionId,
      topicId,
      updatedAt,
      createdAt,
      key,
      question,
      answer1,
      answer2,
      answer3,
      answer4,
      correctAnswer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.questionSetId == this.questionSetId &&
          other.examId == this.examId &&
          other.examidQuestionid == this.examidQuestionid &&
          other.questionId == this.questionId &&
          other.topicId == this.topicId &&
          other.updatedAt == this.updatedAt &&
          other.createdAt == this.createdAt &&
          other.key == this.key &&
          other.question == this.question &&
          other.answer1 == this.answer1 &&
          other.answer2 == this.answer2 &&
          other.answer3 == this.answer3 &&
          other.answer4 == this.answer4 &&
          other.correctAnswer == this.correctAnswer);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<int?> questionSetId;
  final Value<int> examId;
  final Value<int> examidQuestionid;
  final Value<int> questionId;
  final Value<int?> topicId;
  final Value<String?> updatedAt;
  final Value<String?> createdAt;
  final Value<String?> key;
  final Value<String?> question;
  final Value<String?> answer1;
  final Value<String?> answer2;
  final Value<String?> answer3;
  final Value<String?> answer4;
  final Value<String?> correctAnswer;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.questionSetId = const Value.absent(),
    this.examId = const Value.absent(),
    this.examidQuestionid = const Value.absent(),
    this.questionId = const Value.absent(),
    this.topicId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.key = const Value.absent(),
    this.question = const Value.absent(),
    this.answer1 = const Value.absent(),
    this.answer2 = const Value.absent(),
    this.answer3 = const Value.absent(),
    this.answer4 = const Value.absent(),
    this.correctAnswer = const Value.absent(),
  });
  QuestionsCompanion.insert({
    this.id = const Value.absent(),
    this.questionSetId = const Value.absent(),
    required int examId,
    required int examidQuestionid,
    required int questionId,
    this.topicId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.key = const Value.absent(),
    this.question = const Value.absent(),
    this.answer1 = const Value.absent(),
    this.answer2 = const Value.absent(),
    this.answer3 = const Value.absent(),
    this.answer4 = const Value.absent(),
    this.correctAnswer = const Value.absent(),
  })  : examId = Value(examId),
        examidQuestionid = Value(examidQuestionid),
        questionId = Value(questionId);
  static Insertable<Question> custom({
    Expression<int>? id,
    Expression<int>? questionSetId,
    Expression<int>? examId,
    Expression<int>? examidQuestionid,
    Expression<int>? questionId,
    Expression<int>? topicId,
    Expression<String>? updatedAt,
    Expression<String>? createdAt,
    Expression<String>? key,
    Expression<String>? question,
    Expression<String>? answer1,
    Expression<String>? answer2,
    Expression<String>? answer3,
    Expression<String>? answer4,
    Expression<String>? correctAnswer,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionSetId != null) 'question_set_id': questionSetId,
      if (examId != null) 'exam_id': examId,
      if (examidQuestionid != null) 'examid_questionid': examidQuestionid,
      if (questionId != null) 'question_id': questionId,
      if (topicId != null) 'topic_id': topicId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (key != null) 'key': key,
      if (question != null) 'question': question,
      if (answer1 != null) 'answer1': answer1,
      if (answer2 != null) 'answer2': answer2,
      if (answer3 != null) 'answer3': answer3,
      if (answer4 != null) 'answer4': answer4,
      if (correctAnswer != null) 'correct_answer': correctAnswer,
    });
  }

  QuestionsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? questionSetId,
      Value<int>? examId,
      Value<int>? examidQuestionid,
      Value<int>? questionId,
      Value<int?>? topicId,
      Value<String?>? updatedAt,
      Value<String?>? createdAt,
      Value<String?>? key,
      Value<String?>? question,
      Value<String?>? answer1,
      Value<String?>? answer2,
      Value<String?>? answer3,
      Value<String?>? answer4,
      Value<String?>? correctAnswer}) {
    return QuestionsCompanion(
      id: id ?? this.id,
      questionSetId: questionSetId ?? this.questionSetId,
      examId: examId ?? this.examId,
      examidQuestionid: examidQuestionid ?? this.examidQuestionid,
      questionId: questionId ?? this.questionId,
      topicId: topicId ?? this.topicId,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      key: key ?? this.key,
      question: question ?? this.question,
      answer1: answer1 ?? this.answer1,
      answer2: answer2 ?? this.answer2,
      answer3: answer3 ?? this.answer3,
      answer4: answer4 ?? this.answer4,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questionSetId.present) {
      map['question_set_id'] = Variable<int>(questionSetId.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<int>(examId.value);
    }
    if (examidQuestionid.present) {
      map['examid_questionid'] = Variable<int>(examidQuestionid.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<int>(topicId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answer1.present) {
      map['answer1'] = Variable<String>(answer1.value);
    }
    if (answer2.present) {
      map['answer2'] = Variable<String>(answer2.value);
    }
    if (answer3.present) {
      map['answer3'] = Variable<String>(answer3.value);
    }
    if (answer4.present) {
      map['answer4'] = Variable<String>(answer4.value);
    }
    if (correctAnswer.present) {
      map['correct_answer'] = Variable<String>(correctAnswer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('questionSetId: $questionSetId, ')
          ..write('examId: $examId, ')
          ..write('examidQuestionid: $examidQuestionid, ')
          ..write('questionId: $questionId, ')
          ..write('topicId: $topicId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('key: $key, ')
          ..write('question: $question, ')
          ..write('answer1: $answer1, ')
          ..write('answer2: $answer2, ')
          ..write('answer3: $answer3, ')
          ..write('answer4: $answer4, ')
          ..write('correctAnswer: $correctAnswer')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _questionSetIdMeta =
      const VerificationMeta('questionSetId');
  @override
  late final GeneratedColumn<int> questionSetId = GeneratedColumn<int>(
      'question_set_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _examIdMeta = const VerificationMeta('examId');
  @override
  late final GeneratedColumn<int> examId = GeneratedColumn<int>(
      'exam_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _examidQuestionidMeta =
      const VerificationMeta('examidQuestionid');
  @override
  late final GeneratedColumn<int> examidQuestionid = GeneratedColumn<int>(
      'examid_questionid', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _questionIdMeta = const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
      'question_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _topicIdMeta = const VerificationMeta('topicId');
  @override
  late final GeneratedColumn<int> topicId = GeneratedColumn<int>(
      'topic_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _questionMeta = const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _answer1Meta = const VerificationMeta('answer1');
  @override
  late final GeneratedColumn<String> answer1 = GeneratedColumn<String>(
      'answer1', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _answer2Meta = const VerificationMeta('answer2');
  @override
  late final GeneratedColumn<String> answer2 = GeneratedColumn<String>(
      'answer2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _answer3Meta = const VerificationMeta('answer3');
  @override
  late final GeneratedColumn<String> answer3 = GeneratedColumn<String>(
      'answer3', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _answer4Meta = const VerificationMeta('answer4');
  @override
  late final GeneratedColumn<String> answer4 = GeneratedColumn<String>(
      'answer4', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _correctAnswerMeta =
      const VerificationMeta('correctAnswer');
  @override
  late final GeneratedColumn<String> correctAnswer = GeneratedColumn<String>(
      'correct_answer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        questionSetId,
        examId,
        examidQuestionid,
        questionId,
        topicId,
        updatedAt,
        createdAt,
        key,
        question,
        answer1,
        answer2,
        answer3,
        answer4,
        correctAnswer
      ];
  @override
  String get aliasedName => _alias ?? 'questions';
  @override
  String get actualTableName => 'questions';
  @override
  VerificationContext validateIntegrity(Insertable<Question> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question_set_id')) {
      context.handle(
          _questionSetIdMeta,
          questionSetId.isAcceptableOrUnknown(
              data['question_set_id']!, _questionSetIdMeta));
    }
    if (data.containsKey('exam_id')) {
      context.handle(_examIdMeta,
          examId.isAcceptableOrUnknown(data['exam_id']!, _examIdMeta));
    } else if (isInserting) {
      context.missing(_examIdMeta);
    }
    if (data.containsKey('examid_questionid')) {
      context.handle(
          _examidQuestionidMeta,
          examidQuestionid.isAcceptableOrUnknown(
              data['examid_questionid']!, _examidQuestionidMeta));
    } else if (isInserting) {
      context.missing(_examidQuestionidMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(_topicIdMeta,
          topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    }
    if (data.containsKey('answer1')) {
      context.handle(_answer1Meta,
          answer1.isAcceptableOrUnknown(data['answer1']!, _answer1Meta));
    }
    if (data.containsKey('answer2')) {
      context.handle(_answer2Meta,
          answer2.isAcceptableOrUnknown(data['answer2']!, _answer2Meta));
    }
    if (data.containsKey('answer3')) {
      context.handle(_answer3Meta,
          answer3.isAcceptableOrUnknown(data['answer3']!, _answer3Meta));
    }
    if (data.containsKey('answer4')) {
      context.handle(_answer4Meta,
          answer4.isAcceptableOrUnknown(data['answer4']!, _answer4Meta));
    }
    if (data.containsKey('correct_answer')) {
      context.handle(
          _correctAnswerMeta,
          correctAnswer.isAcceptableOrUnknown(
              data['correct_answer']!, _correctAnswerMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      questionSetId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}question_set_id']),
      examId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}exam_id'])!,
      examidQuestionid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}examid_questionid'])!,
      questionId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}question_id'])!,
      topicId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}topic_id']),
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at']),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      key: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}key']),
      question: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}question']),
      answer1: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}answer1']),
      answer2: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}answer2']),
      answer3: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}answer3']),
      answer4: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}answer4']),
      correctAnswer: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}correct_answer']),
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class DriftUserModel extends DataClass implements Insertable<DriftUserModel> {
  final int id;
  final int userId;
  final String? name;
  final String? phoneNo;
  final String? email;
  final String? address;
  final String? dateOfBirth;
  final String? status;
  final String? image;
  final String? loginType;
  const DriftUserModel(
      {required this.id,
      required this.userId,
      this.name,
      this.phoneNo,
      this.email,
      this.address,
      this.dateOfBirth,
      this.status,
      this.image,
      this.loginType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || phoneNo != null) {
      map['phone_no'] = Variable<String>(phoneNo);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<String>(dateOfBirth);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || loginType != null) {
      map['login_type'] = Variable<String>(loginType);
    }
    return map;
  }

  DriftUserModelsCompanion toCompanion(bool nullToAbsent) {
    return DriftUserModelsCompanion(
      id: Value(id),
      userId: Value(userId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phoneNo: phoneNo == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNo),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      loginType: loginType == null && nullToAbsent
          ? const Value.absent()
          : Value(loginType),
    );
  }

  factory DriftUserModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftUserModel(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String?>(json['name']),
      phoneNo: serializer.fromJson<String?>(json['phoneNo']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      dateOfBirth: serializer.fromJson<String?>(json['dateOfBirth']),
      status: serializer.fromJson<String?>(json['status']),
      image: serializer.fromJson<String?>(json['image']),
      loginType: serializer.fromJson<String?>(json['loginType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String?>(name),
      'phoneNo': serializer.toJson<String?>(phoneNo),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'dateOfBirth': serializer.toJson<String?>(dateOfBirth),
      'status': serializer.toJson<String?>(status),
      'image': serializer.toJson<String?>(image),
      'loginType': serializer.toJson<String?>(loginType),
    };
  }

  DriftUserModel copyWith(
          {int? id,
          int? userId,
          Value<String?> name = const Value.absent(),
          Value<String?> phoneNo = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> dateOfBirth = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> loginType = const Value.absent()}) =>
      DriftUserModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name.present ? name.value : this.name,
        phoneNo: phoneNo.present ? phoneNo.value : this.phoneNo,
        email: email.present ? email.value : this.email,
        address: address.present ? address.value : this.address,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
        status: status.present ? status.value : this.status,
        image: image.present ? image.value : this.image,
        loginType: loginType.present ? loginType.value : this.loginType,
      );
  @override
  String toString() {
    return (StringBuffer('DriftUserModel(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('phoneNo: $phoneNo, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('status: $status, ')
          ..write('image: $image, ')
          ..write('loginType: $loginType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name, phoneNo, email, address,
      dateOfBirth, status, image, loginType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftUserModel &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.phoneNo == this.phoneNo &&
          other.email == this.email &&
          other.address == this.address &&
          other.dateOfBirth == this.dateOfBirth &&
          other.status == this.status &&
          other.image == this.image &&
          other.loginType == this.loginType);
}

class DriftUserModelsCompanion extends UpdateCompanion<DriftUserModel> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String?> name;
  final Value<String?> phoneNo;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> dateOfBirth;
  final Value<String?> status;
  final Value<String?> image;
  final Value<String?> loginType;
  const DriftUserModelsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNo = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.status = const Value.absent(),
    this.image = const Value.absent(),
    this.loginType = const Value.absent(),
  });
  DriftUserModelsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    this.name = const Value.absent(),
    this.phoneNo = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.status = const Value.absent(),
    this.image = const Value.absent(),
    this.loginType = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<DriftUserModel> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? phoneNo,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? dateOfBirth,
    Expression<String>? status,
    Expression<String>? image,
    Expression<String>? loginType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (phoneNo != null) 'phone_no': phoneNo,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (status != null) 'status': status,
      if (image != null) 'image': image,
      if (loginType != null) 'login_type': loginType,
    });
  }

  DriftUserModelsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String?>? name,
      Value<String?>? phoneNo,
      Value<String?>? email,
      Value<String?>? address,
      Value<String?>? dateOfBirth,
      Value<String?>? status,
      Value<String?>? image,
      Value<String?>? loginType}) {
    return DriftUserModelsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      status: status ?? this.status,
      image: image ?? this.image,
      loginType: loginType ?? this.loginType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNo.present) {
      map['phone_no'] = Variable<String>(phoneNo.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (loginType.present) {
      map['login_type'] = Variable<String>(loginType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftUserModelsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('phoneNo: $phoneNo, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('status: $status, ')
          ..write('image: $image, ')
          ..write('loginType: $loginType')
          ..write(')'))
        .toString();
  }
}

class $DriftUserModelsTable extends DriftUserModels
    with TableInfo<$DriftUserModelsTable, DriftUserModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftUserModelsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _phoneNoMeta = const VerificationMeta('phoneNo');
  @override
  late final GeneratedColumn<String> phoneNo = GeneratedColumn<String>(
      'phone_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
      'date_of_birth', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _loginTypeMeta = const VerificationMeta('loginType');
  @override
  late final GeneratedColumn<String> loginType = GeneratedColumn<String>(
      'login_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        name,
        phoneNo,
        email,
        address,
        dateOfBirth,
        status,
        image,
        loginType
      ];
  @override
  String get aliasedName => _alias ?? 'drift_user_models';
  @override
  String get actualTableName => 'drift_user_models';
  @override
  VerificationContext validateIntegrity(Insertable<DriftUserModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('phone_no')) {
      context.handle(_phoneNoMeta,
          phoneNo.isAcceptableOrUnknown(data['phone_no']!, _phoneNoMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('login_type')) {
      context.handle(_loginTypeMeta,
          loginType.isAcceptableOrUnknown(data['login_type']!, _loginTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftUserModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftUserModel(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      phoneNo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}phone_no']),
      email: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      address: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      dateOfBirth: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}date_of_birth']),
      status: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      image: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      loginType: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}login_type']),
    );
  }

  @override
  $DriftUserModelsTable createAlias(String alias) {
    return $DriftUserModelsTable(attachedDatabase, alias);
  }
}

abstract class _$MyExamDatabase extends GeneratedDatabase {
  _$MyExamDatabase(QueryExecutor e) : super(e);
  late final $ExamsTable exams = $ExamsTable(this);
  late final $QuestionSetsTable questionSets = $QuestionSetsTable(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $DriftUserModelsTable driftUserModels =
      $DriftUserModelsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [exams, questionSets, questions, driftUserModels];
}
