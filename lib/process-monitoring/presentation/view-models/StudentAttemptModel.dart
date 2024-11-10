import 'package:flutter/cupertino.dart';

class StudentAttemptModel {
  const StudentAttemptModel(
      {required this.blacklistedProcesses,
        required this.latestScreenshot,
        required this.studentId,
        required this.macAddress});

  final String studentId;
  final String macAddress;
  final List<String> blacklistedProcesses;
  final List<String>? latestScreenshot;
}
