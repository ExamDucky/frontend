import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/exam-management/data/ExamRepository.dart';
import 'package:smart_usb_desktop/test-management/data/TestRepository.dart';

class GetExamDetailsController extends StateNotifier<AsyncValue<dynamic>> {
  GetExamDetailsController({required this.examRepository})
      : super(const AsyncData<void>(null));

  final ExamRepository examRepository;

  Future<dynamic> getExamDetails({required int testId}) async {
    state = const AsyncLoading<dynamic>();
    state = await AsyncValue.guard<dynamic>(
        () => examRepository.getExamDetails(testId: testId));
  }
}
