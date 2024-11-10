import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_usb_desktop/main.dart';
import 'package:smart_usb_desktop/test-management/data/TestRepository.dart';
import 'package:http/http.dart' as http;
import 'package:smart_usb_desktop/test-management/domain/TestListModel.dart';
import 'package:smart_usb_desktop/test-management/domain/TestModel.dart';

class HttpTestRepository implements TestRepository {
  const HttpTestRepository({required this.client, required this.domain});

  final String domain;
  final http.Client client;

  @override
  Future getSearchTest({required String testQuery}) async {
    try {
      var response = await http.get(
          Uri.http(domain, "test/search", {"titleQuery": testQuery}),
          headers: {
            "Authorization": "Bearer ${await storage.read(key: "token")}"
          });
      if (response.statusCode == 200) {
        return TestListModel.fromJson({'tests': jsonDecode(response.body)});
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Future postCreateTest(
      {required String title,
      required int duration,
      required String groupOneTestFileUri,
      required String groupTwoTestFileUri,
      required String blacklistProcessesFileName}) async {
    try {
      var response = await http.post(Uri.http(domain, "test/create"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${await storage.read(key: "token")}"
          },
          body: jsonEncode({
            "title": title,
            "duration": duration,
            "description": "",
            "groupOneTestFileUri": groupOneTestFileUri,
            "groupTwoTestFileUri": groupTwoTestFileUri,
            "blacklistProcessesFileName": blacklistProcessesFileName
          }));
      if (response.statusCode == 200) {
        return TestModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Future postUpdateFile({
    required Uint8List fileContent,
    required String fileName,
    required String testFileType,
    required int testId,
  }) async {
    try {
      final baseUrl = 'http://${domain}/test/$testId/import-file';


      final Uri url = Uri.parse(baseUrl).replace(
        queryParameters: {
          'filename': fileName,
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
