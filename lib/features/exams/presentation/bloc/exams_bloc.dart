import 'package:bloc/bloc.dart';
import 'package:creatu_exam/core/error/error_model.dart';
import 'package:creatu_exam/features/exams/data/models/exam_model.dart';
import 'package:creatu_exam/features/exams/domain/repositories/exam_repository.dart';
import 'package:equatable/equatable.dart';

part 'exams_event.dart';
part 'exams_state.dart';

mixin RegisterExamBloc on Bloc<ExamsEvent, ExamsState> {}

class ExamsBloc extends Bloc<ExamsEvent, ExamsState> with RegisterExamBloc {
  ExamsBloc({required this.examRepository}) : super(ExamsInitial()) {
    on<FirestoreLoaderEvent>((event, emit) {
      // emit(ExamsDataState(event.examList));
    });
    on<FetchFirebaseExamEvent>(
      (event, emit) async {
        emit(ExamsLoading());
        try {
          await emit.forEach(
            examRepository.getExamList(
              courseId: event.courseId,
            ),
            onData: (List<ExamModel> data) {
              // data.shuffle();
              return ExamsDataState(data);
            },
          );
          // _streamSubscription?.cancel;
          // _streamSubscription = examRepository.getExamList().listen((event) {
          //   print('event222');
          //   log('$event');
          //   add(FirestoreLoaderEvent(event));
          // });
        } catch (e) {
          emit(ExamsErrorState(ErrorModel(message: '$e')));
        }
      },
      // transformer: restartable(),
    );
    on<CheckResgisterExamEvent>((event, emit) async {
      emit(ExamsLoading());
      final examData = await examRepository.checkIfRegisteredForExam(
        email: event.email,
        examId: event.examId,
      );
      return examData.fold(
        (l) => emit(
          RegisterSuccessState(
            sucessData: l,
            email: event.email,
          ),
        ),
        (r) => emit(ExamsErrorState(r)),
      );
    });
  }
  final ExamRepository examRepository;
  // StreamSubscription<List<ExamModel>>? _streamSubscription;
}
