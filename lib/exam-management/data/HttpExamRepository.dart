import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_usb_desktop/exam-management/data/ExamRepository.dart';
import 'package:http/http.dart' as http;
import 'package:smart_usb_desktop/exam-management/domain/ExamIdModel.dart';
import 'package:smart_usb_desktop/exam-management/domain/ExamModel.dart';
import 'package:smart_usb_desktop/main.dart';

class HttpExamRepository implements ExamRepository {
  const HttpExamRepository({required this.domain, required this.client});

  final String domain;
  final http.Client client;

  @override
  Future getExamDetails({required int testId}) async {
    try {
      var response = await http
          .get(Uri.http(domain, "test/${testId}/test-files"), headers: {
        "Authorization": "Bearer ${await storage.read(key: "token")}"
      });
      if (response.statusCode == 200) {
        return ExamModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Future postStartExam({required int testId, required classroomName}) async {
    try {
      var response = await http.post(Uri.http(domain, "exam/start"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await storage.read(key: "token")}"
          },
          body: jsonEncode({
            "testId": testId,
            "classroomName": classroomName,
          }));
      if (response.statusCode == 200) {
        return ExamIdModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Future createExamAttempt(
      {required int examId,
      required String studentId,
      required String macAddress}) async {
    try {
      var response =
          await http.post(Uri.http(domain, "exam/$examId/exam-attempt/create"),
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer ${await storage.read(key: "token")}"
              },
              body: jsonEncode({
                "studentId": studentId,
                "macAddress": macAddress,
              }));
      if (response.statusCode == 200) {
        return ExamIdModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Future putUpdateExamAttemptFile(
      {required Uint8List fileContent,
      required int examId,
      required String fileName,
      required String studentId,
      required int examAttemptId,
      required String testFileType}) async {
    try {
      final baseUrl = 'http://${domain}/exam/$examId/exam-attempt/submit';


      final Uri url = Uri.parse(baseUrl).replace(
        queryParameters: {
          'filename': fileName,
          'studentIdentification': studentId,
          'examAttemptId': examAttemptId,
          'testFileType': testFileType,
        },
      );

      var request = http.MultipartRequest('PUT', url);

      request.files.add(http.MultipartFile.fromBytes(
        'file', // Field name expected by the server
        fileContent, // The content of the file
        filename: fileName, // Name of the file
        contentType: MediaType('application', 'x-zip-compressed'), // Correct MIME type for zip files
      ));

      request.headers.addAll({
        "Authorization": "Bearer ${await storage.read(key: "token")}",
      });

      var response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      throw Exception("Error occurred while sending the request: $e");
    }
    }
}
