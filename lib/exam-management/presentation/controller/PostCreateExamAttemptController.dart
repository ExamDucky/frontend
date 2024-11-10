import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/exam-management/data/ExamRepository.dart';

class PostCreateExamAttemptController
    extends StateNotifier<AsyncValue<dynamic>> {
  PostCreateExamAttemptController({required this.examRepository})
      : super(const AsyncData<void>(null));

  final ExamRepository examRepository;

  Future<dynamic> postCreateExamAttempt(
      {required int examId,
      required String macAddress,
      required String studentId}) async {
    state = const AsyncLoading<dynamic>();
    state =
        await AsyncValue.guard<dynamic>(() => examRepository.createExamAttempt(
              examId: examId,
              macAddress: macAddress,
              studentId: studentId,
            ));
  }
}
