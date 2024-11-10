import 'dart:typed_data';

abstract class TestRepository {
  Future<dynamic> getSearchTest({required String testQuery});

  Future<dynamic> postCreateTest(
      {required String title,
      required int duration,
      required String groupOneTestFileUri,
      required String groupTwoTestFileUri,
      required String blacklistProcessesFileName});

  Future<dynamic> postUpdateFile(
      {required Uint8List fileContent,
      required String fileName,
      required String testFileType,
      required int testId});
}
