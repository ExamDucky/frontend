
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/exam-management/data/ExamRepository.dart';

class PostStartExamController extends StateNotifier<AsyncValue<dynamic>> {
  PostStartExamController({required this.examRepository})
      : super(const AsyncData<void>(null));

  final ExamRepository examRepository;

  Future<dynamic> postStartExam({required int testId, required String classroomName}) async {
    state = const AsyncLoading<dynamic>();
    state = await AsyncValue.guard<dynamic>(() => examRepository.postStartExam(
        testId: testId,
        classroomName: classroomName));
  }
}
