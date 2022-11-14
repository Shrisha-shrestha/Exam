import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'save_result_drift_model.g.dart';

@DataClassName('Question')
class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get questionSetId => integer().nullable()();

  IntColumn get examId => integer()(); //added new columnv v2
  IntColumn get examidQuestionid => integer().unique()(); //added new columnv v3
  // references(QuestionSets, #setId)();
  IntColumn get questionId => integer()();
  IntColumn get topicId => integer().nullable()();
  TextColumn get updatedAt => text().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get key => text().nullable()();
  TextColumn get question => text().nullable()();
  TextColumn get answer1 => text().nullable()();
  TextColumn get answer2 => text().nullable()();
  TextColumn get answer3 => text().nullable()();
  TextColumn get answer4 => text().nullable()();
  TextColumn get correctAnswer => text().nullable()();
}

@DataClassName('DriftUserModel')
class DriftUserModels extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().unique()();
  // references(QuestionSets, #setId)();

  TextColumn get name => text().nullable()();
  TextColumn get phoneNo => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get dateOfBirth => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get loginType => text().nullable()();
}

@DataClassName('QuestionSet')
class QuestionSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get setId => integer().unique()();
  TextColumn get examId => text().references(Exams, #examId)();
  TextColumn get createdAt => text().nullable()();
}

@DataClassName('Exam')
class Exams extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get examId => text().unique()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get thumbnail => text().nullable()();
  TextColumn get questionsSetId => text().nullable()();
  TextColumn get informationVideo => text().nullable()();
}

@DriftDatabase(tables: [Exams, QuestionSets, Questions, DriftUserModels])
class MyExamDatabase extends _$MyExamDatabase {
  MyExamDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // we added the examId property in the change from version 1 to
          // version 2
          await m.addColumn(questions, questions.examId);
        }
        if (from < 3) {
          // we added the examidQuestionid property in the change from version 1 or 2
          // to version 3
          await m.addColumn(questions, questions.examidQuestionid);
        }
      },
    );
  }

  Future<int> insertOrUpdateAnswer(QuestionsCompanion question) async {
    return (into(questions)).insert(
      question.copyWith(
        examidQuestionid: Value(
          question.examId.value.concatInt(question.questionId.value),
        ),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<int> insertOrUpdateUser(DriftUserModelsCompanion user) async {
    return (into(driftUserModels)).insert(
      user,
      mode: InsertMode.insertOrReplace,
    );
  }

  Stream<List<Question>> getAllAnswerForSet(int examId) {
    return (select(questions)..where((tbl) => tbl.examId.equals(examId)))
        .watch();
  }

  Future<List<Question>> forResultCalculation(int examId) {
    return (select(questions)..where((tbl) => tbl.examId.equals(examId))).get();
  }

  Stream<List<int>> getQuestionIdList(int examId) {
    final q = (select(questions)..where((tbl) => tbl.examId.equals(examId)));

    return (q.map((p0) => p0.questionId)).watch();
  }

  // void answerQuestionCount(int setId) {
  //   final countOfQuestion = questions.id.count();

  //   final query = (select(questions)
  //     ..where((tbl) => tbl.questionSetId.equals(setId))
  //     ..addColumns([countOfQuestion]));
  //   // query.map((row) => row.read(countOfQuestion)).watchSingle();
  //   query.map((row) => row.questionSetId!.read(countOfcountOfQuestion)).watchSingle();
  // }

  Stream<DriftUserModel?> getUser() {
    try {
      return (select(driftUserModels)..limit(1)).watchSingle();
    } catch (e) {
      return Stream.error('User not Found');
    }
  }

  Future<DriftUserModel?> getUserF() {
    try {
      return (select(driftUserModels)..limit(1)).getSingle();
    } catch (e) {
      return Future.delayed(
        Duration.zero,
        () => null,
      );
    }
  }

  Future<int> deleteAnsweredQuestions() {
    return (delete(questions)..where((tbl) => tbl.id.isNotNull())).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

extension IntConcat on int {
  int concatInt(int secondInteger) {
    var pow = 10;
    while (this >= pow) {
      pow *= 10;
    }

    return secondInteger * pow + this;
  }
}
