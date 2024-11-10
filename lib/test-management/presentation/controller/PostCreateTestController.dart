import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/test-management/data/TestRepository.dart';

class PostCreateTestController extends StateNotifier<AsyncValue<dynamic>> {
  PostCreateTestController({required this.testRepository})
      : super(const AsyncData<void>(null));

  final TestRepository testRepository;

  Future<dynamic> postCreateTest(
      {required String title,
      required int duration,
      required String groupOneTestFileUri,
      required String groupTwoTestFileUri,
      required String blacklistProcessesFileName}) async {
    state = const AsyncLoading<dynamic>();
    state = await AsyncValue.guard<dynamic>(() => testRepository.postCreateTest(
        title: title,
        blacklistProcessesFileName: blacklistProcessesFileName,
        duration: duration,
        groupOneTestFileUri: groupOneTestFileUri,
        groupTwoTestFileUri: groupTwoTestFileUri));
  }
}
