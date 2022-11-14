part of 'exams_bloc.dart';

abstract class ExamsEvent extends Equatable {
  const ExamsEvent();

  @override
  List<Object> get props => [];
}

class FetchFirebaseExamEvent extends ExamsEvent {
  const FetchFirebaseExamEvent({this.courseId});

  final int? courseId;
}

class FirestoreLoaderEvent extends ExamsEvent {
  const FirestoreLoaderEvent(this.examList);
  final List<ExamModel> examList;
}

class CheckResgisterExamEvent extends ExamsEvent {
  const CheckResgisterExamEvent({required this.email, required this.examId});
  final String email;
  final int examId;
}
