import 'package:flutter/cupertino.dart';

class StudentExamAttemptModel {
  const StudentExamAttemptModel(
      {required this.examSubmitted,
      required this.studentId,
      required this.grade,
      required this.plagiarismPercent,
      required this.isValid});

  final Text studentId;
  final Icon examSubmitted;
  final Text plagiarismPercent;
  final Icon isValid;
  final Text grade;
}
