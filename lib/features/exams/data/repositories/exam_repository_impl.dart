// ignore_for_file: avoid_catching_errors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/core/error/success_model.dart';
import 'package:creatu_exam/core/helper/custom_error_handling.dart';
import 'package:creatu_exam/core/network/dio_service.dart';
import 'package:creatu_exam/core/network/network_type.dart';
import 'package:creatu_exam/features/exams/data/models/exam_model.dart';
import 'package:creatu_exam/features/exams/data/models/result_submit_model.dart';
import 'package:creatu_exam/features/exams/domain/repositories/exam_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExamRepositoryImpl extends ExamRepository {
  ExamRepositoryImpl({required this.dioService});
  final DioService dioService;
  @override
  Stream<List<ExamModel>> getExamList({int? courseId}) {
    try {
      if (courseId != null) {
        return FirebaseFirestore.instance
            .collection('courseExams')
            .where('course_id', isEqualTo: '$courseId')
            .snapshots()
            .map((events) {
          final data = <ExamModel>[];
          for (final e in events.docs) {
            data.add(ExamModel.fromJson(e.data()));
          }
          // data.shuffle();
          return data;
        });
      }
      return FirebaseFirestore.instance
          .collection('exams')
          .snapshots()
          .map((events) {
        final data = <ExamModel>[];
        for (final e in events.docs) {
          data.add(ExamModel.fromJson(e.data()));
        }
        return data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<ExamModel, ErrorModel>> checkIfRegisteredForExam({
    required String email,
    required int examId,
  }) async {
    try {
      return await FirebaseFirestore.instance
          .collection('exams')
          .where('id', isEqualTo: examId)
          .where(
            'registered_users',
            arrayContains: email,
          )
          .limit(1)
          .get()
          .then((value) {
        return Left(ExamModel.fromJson(value.docs.first.data()));
      });
    } on StateError {
      return const Right(
        ErrorModel(
          message: 'You are not register for Exam',
        ),
      );
    } catch (e) {
      return Right(
        ErrorModel(
          message: '$e',
        ),
      );
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> submitExam({
    required ResultSubmitModel resultModel,
  }) async {
    try {
      final response = await dioService.apiCall(
        '',
        networkType: NetworkType.POST,
        formData: FormData.fromMap(resultModel.toJson()),
      );
      return response.fold(
        (l) => Left(SuccessModel.fromJson(l.data as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }

  @override
  Future<Either<SuccessModel, ErrorModel>> registerForExam({
    required int examId,
  }) async {
    try {
      final response = await dioService.apiCall(
        '',
        networkType: NetworkType.POST,
        formData: FormData.fromMap({
          'exam_id': examId,
        }),
      );
      return response.fold(
        (l) => Left(SuccessModel.fromJson(l.data as Map<String, dynamic>)),
        Right.new,
      );
    } catch (e) {
      return Right(ErrorModel(message: '${DioExceptionError.fromDioError(e)}'));
    }
  }
}
