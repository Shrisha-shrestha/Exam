import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/features/exams/data/models/exam_model.dart';
import 'package:creatu_exam/features/exams/data/models/result_submit_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExamRepository {
  Stream<List<ExamModel>> getExamList({int? courseId});
  Future<Either<ExamModel, ErrorModel>> checkIfRegisteredForExam({
    required String email,
    required int examId,
  });
  Future<Either<SuccessModel, ErrorModel>> registerForExam({
   
    required int examId,
  });

  Future<Either<SuccessModel, ErrorModel>> submitExam({
    required ResultSubmitModel resultModel,
  });
}
