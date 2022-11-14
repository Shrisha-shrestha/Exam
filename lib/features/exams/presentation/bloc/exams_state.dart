part of 'exams_bloc.dart';

abstract class ExamsState {
  const ExamsState();
}

class ExamsInitial extends ExamsState {}

class ExamsLoading extends ExamsState {}

class RegisterSuccessState extends ExamsState {
  const RegisterSuccessState({
    required this.sucessData,
    required this.email,
  });
  final ExamModel sucessData;
  final String email;
}

class ExamsErrorState extends ExamsState {
  const ExamsErrorState(this.errors);
  final ErrorModel errors;
}

class ExamsDataState extends ExamsState {
  const ExamsDataState(this.data);
  final List<ExamModel> data;
}
