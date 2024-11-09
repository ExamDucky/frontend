import 'package:flutter/cupertino.dart';

class StudentExamProcessMonitoringModel {
  const StudentExamProcessMonitoringModel(
      {required this.blacklistedProcesses,
      required this.latestScreenshot,
      required this.studentId,
      required this.macAddress});

  final Text studentId;
  final Text macAddress;
  final Widget? blacklistedProcesses;
  final Widget? latestScreenshot;
}
