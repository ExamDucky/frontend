import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/test-management/data/TestRepository.dart';

class PutUpdateFileController extends StateNotifier<AsyncValue<dynamic>> {
  PutUpdateFileController({required this.testRepository})
      : super(const AsyncData<void>(null));

  final TestRepository testRepository;

  Future<dynamic> putUploadTest(
      {required String fileName,
      required Uint8List fileContent,
      required String testFileType,
      required int testId}) async {
    state = const AsyncLoading<dynamic>();
    state = await AsyncValue.guard<dynamic>(() => testRepository.postUpdateFile(
        testFileType: testFileType,
        fileName: fileName,
        fileContent: fileContent,
        testId: testId));
  }
}
