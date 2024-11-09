import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

mixin FileUploadUtils {


  Future<Uint8List?> pickFile({
    required Function(int, int) setProgressPercent,
    required Function(String) setFileName,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip', 'txt']
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        String? filePath = file.path;

        if (filePath == null) {
          print("File path is null");
          return null;
        }

        File selectedFile = File(filePath);

        if (!await selectedFile.exists()) {
          print("File does not exist at the given path");
          return null;
        }

        Uint8List fileBytes = await selectedFile.readAsBytes();
        int totalBytes = fileBytes.length;
        int readBytes = 0;

       setFileName(file.name);
        for (int i = 0; i < totalBytes; i += 1024) {
          int end = (i + 1024 > totalBytes) ? totalBytes : i + 1024;

          readBytes += (end - i);
          setProgressPercent(readBytes, totalBytes);
        }

        return fileBytes;
      }

      return null;
    } catch (e, st) {
      print("Error: $e");
      print("Stack trace: $st");
    }
    return null;
  }


  int countLines(String content) {
    List<String> lines = content.split(RegExp(r'\r\n|\r|\n'));
    return lines.length;
  }

  bool validate(String? fileContent, String fileFormat) {
    if (fileContent == null) {
      return false;
    }
    List<String> lines = fileContent.split('\n');
    String firstLine = lines.first.trim();
    if (firstLine.toLowerCase() == fileFormat.trim().toLowerCase()) {
      return true;
    }
    return false;
  }

  void showIncorrectFormatDialog(
      BuildContext context, String fileName, String fileExtension) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
            content: Text(
                "Incorrect file type: $fileName\nOnly files with $fileExtension extension is allowed!")));
  }
}
