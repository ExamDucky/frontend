import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:smart_usb_desktop/exam-management/presentation/view-models/StudentExamAttemptModel.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/view-models/StudentAttemptModel.dart';
import 'package:smart_usb_desktop/shared/providers/Providers.dart';

mixin DirectoryHandlingUtils {
  Future<List<String>> monitorNewDirectories(
      List<String> oldDirectories) async {
    List<String> difference = [];
    Directory tempDir = await getApplicationDocumentsDirectory();
    String tempPath = "${tempDir.path}\\test";
    List<Directory> currentDirectories = await _getDirectories(tempPath);
    for (var current in currentDirectories) {
      if (!oldDirectories.contains(current.path)) {
        difference.add(current.path);
      }
    }
    return difference;
  }

  Future<List<String>> readFileProcessBlacklisted(String path,
      List<String> blacklistedProcessesList, BuildContext context) async {
    try {
      final file = File(path);
      List<String> bp = [];

      if (await file.exists()) {
        List<String> lines = await file.readAsLines();

        for (int i = 0; i < lines.length; i++) {
          String line = lines[i];
          for (int j = 0; j < blacklistedProcessesList.length; j++) {
            if (line.contains(blacklistedProcessesList[j])) {
              bp.add(blacklistedProcessesList[j]);
            }
          }
        }
        return bp; // Return the list if processing is successful
      } else {
        print('The file does not exist at the specified path.');
        return []; // Return an empty list if file doesn't exist
      }
    } catch (e) {
      print('Error reading file: $e');
      return []; // Return an empty list if there is an error
    }
  }

  Future<StudentAttemptModel?> readFileProcessMonitoring(
      String path, BuildContext context) async {
    try {
      final file = File(path);
      StudentAttemptModel? model;
      if (await file.exists()) {
        List<String> lines = await file.readAsLines();

        if (lines.length >= 3) {
          String studentId = lines[0];
          String fullName = lines[1];
          String macAddress = lines[2];

          String newPath = path.replaceAll("info.txt", "processes.txt");
          List<String> blProc = await readFileProcessBlacklisted(
              newPath, ["discord", "firefox", "kcalc"], context);

          model = StudentAttemptModel(
              macAddress: macAddress,
              studentId: studentId,
              blacklistedProcesses: blProc,
              latestScreenshot: [
                "assets/images/sc1.png",
                "assets/images/sc2.png",
                "assets/images/sc3.png"
              ]);
          return model;
        } else {
          print(
              'The file does not have enough lines to read studentId, fullName, and macAddress.');
          return model;
        }
      } else {
        print('The file does not exist at the specified path.');
        return model;
      }
    } catch (e) {
      print('Error reading file: $e');
    }
  }

  Future<StudentExamAttemptModel?> readFile(String path, BuildContext context,
      int examId, WidgetRef ref, List<String> newFilesList) async {
    try {
      final file = File(path);
      StudentExamAttemptModel? model;
      if (await file.exists()) {
        List<String> lines = await file.readAsLines();

        if (lines.length >= 3) {
          String studentId = lines[0];
          String fullName = lines[1];
          String macAddress = lines[2];

          print(newFilesList);
          print(path);

          for (int i = 0; i < newFilesList.length; i++) {
            if (newFilesList.contains(path.replaceAll("\\info.txt", ""))) {
              ref
                  .read(postCreateExamAttemptControllerProvider.notifier)
                  .postCreateExamAttempt(
                      studentId: studentId,
                      macAddress: macAddress,
                      examId: examId);
            }
          }

          model = StudentExamAttemptModel(
              examSubmitted: const Icon(
                Icons.close,
                color: Colors.red,
              ),
              studentId: Text(
                studentId,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              grade: Text(
                "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              plagiarismPercent: Text(
                "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              isValid: Icon(
                Icons.circle,
                color: Theme.of(context).cardColor,
              ));
          return model;
        } else {
          print(
              'The file does not have enough lines to read studentId, fullName, and macAddress.');
          return model;
        }
      } else {
        print('The file does not exist at the specified path.');
        return model;
      }
    } catch (e) {
      print('Error reading file: $e');
    }
  }

  Future<void> downloadFile(
      String url, String filename, BuildContext context) async {
    try {
      var response =
          await http.Client().send(http.Request('GET', Uri.parse(url)));

      Directory tempDir = await getApplicationDocumentsDirectory();
      String tempPath = tempDir.path;

      print('$tempPath/$filename');

      File file = File('$tempPath\\test\\$filename');

      var sink = file.openWrite();

      int totalBytes = response.contentLength ?? 0;
      int bytesWritten = 0;
      response.stream.listen(
        (List<int> chunk) {
          bytesWritten += chunk.length;
          sink.add(chunk);
        },
        onDone: () {
          sink.close();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).canvasColor,
            content: Text(
              'Download complete! File saved at $file',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ));
        },
        onError: (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error: $e'),
          ));
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $e'),
      ));
    }
  }

  Future<List<Directory>> _getDirectories(String path) async {
    final dir = Directory(path);
    var entities = await dir.list(recursive: false).toList();
    return entities.whereType<Directory>().toList();
  }
}
