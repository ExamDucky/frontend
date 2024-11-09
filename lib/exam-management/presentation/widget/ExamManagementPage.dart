import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/exam-management/presentation/utils/TimerUtils.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/ExamManagementLeftSection.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/ExamManagementRightSection.dart';

class ExamManagementPage extends StatefulWidget {
  const ExamManagementPage(
      {super.key,
      required this.examStartedAt,
      required this.isExamStarted,
      required this.examRemainingTime,
      required this.examTotalTime,
      required this.setStartedAtMessage,
      required this.startExam,
      required this.startTimer});

  final bool isExamStarted;
  final String examStartedAt;
  final int examRemainingTime;
  final int examTotalTime;
  final void Function(String) setStartedAtMessage;
  final void Function() startExam;
  final void Function(int) startTimer;

  @override
  State<ExamManagementPage> createState() => _ExamManagementPageState();
}

class _ExamManagementPageState extends State<ExamManagementPage>
    with TimerUtils {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isExamStarted
                ? Container(
                    width: 150,
                  )
                : Container(),
            Text(
              "EXAM",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            widget.isExamStarted
                ? Text(formatTime(widget.examRemainingTime))
                : Container()
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Row(
          children: [
            ExamManagementLeftSection(
              startTimer: widget.startTimer,
              startExam: widget.startExam,
              setStartedAtMessage: widget.setStartedAtMessage,
              startedAtMessage: widget.examStartedAt,
            ),
            const ExamManagementRightSection()
          ],
        ))
      ],
    );
  }
}
