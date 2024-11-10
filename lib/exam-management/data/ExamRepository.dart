import 'dart:typed_data';

abstract class ExamRepository {
  Future<dynamic> getExamDetails({required int testId});

  Future<dynamic> postStartExam({required int testId, required classroomName});

  Future<dynamic> createExamAttempt(
      {required int examId, required String studentId, required String macAddress});

  Future<dynamic> putUpdateExamAttemptFile(
      {required Uint8List fileContent,
        required int examId,
        required String fileName,
        required String studentId,
        required int examAttemptId,
        required String testFileType});
}
