import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/exam-management/presentation/utils/DirectoryHandlingUtils.dart';
import 'package:smart_usb_desktop/exam-management/presentation/utils/TimerUtils.dart';
import 'package:smart_usb_desktop/exam-management/presentation/view-models/StudentExamAttemptModel.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/ExamManagementLeftSection.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/ExamManagementRightSection.dart';

final examIdProvider = StateProvider<int>((ref) => -1);

class ExamManagementPage extends ConsumerStatefulWidget {
  const ExamManagementPage(
      {super.key,
      required this.examStartedAt,
      required this.isExamStarted,
      required this.examRemainingTime,
      required this.examTotalTime,
      required this.setStartedAtMessage,
      required this.startExam,
      required this.endExam,
      required this.startTimer,
      required this.cancelTimer});

  final bool isExamStarted;
  final String examStartedAt;
  final int examRemainingTime;
  final int examTotalTime;
  final void Function(String) setStartedAtMessage;
  final void Function() startExam;
  final void Function() endExam;
  final void Function(int) startTimer;
  final void Function() cancelTimer;

  @override
  ConsumerState<ExamManagementPage> createState() => _ExamManagementPageState();
}

class _ExamManagementPageState extends ConsumerState<ExamManagementPage>
    with TimerUtils, DirectoryHandlingUtils {
  Timer? timer;
  List<String> currentDirectories = [];
  List<StudentExamAttemptModel> studentAttempts = [];

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
              cancelTimer: widget.cancelTimer,
              startExam: () {
                timer =
                    Timer.periodic(const Duration(seconds: 5), (timer) async {
                  var temp = await monitorNewDirectories(currentDirectories);
                  setState(() {
                    currentDirectories += temp;
                  });
                  List<StudentExamAttemptModel> model = [];
                  for (var path in currentDirectories) {
                    var m = await readFile("${path}\\info.txt", context,
                        ref.watch(examIdProvider), ref, temp);
                    temp = [];
                    if (m != null) {
                      model.add(m);
                    }
                  }
                  setState(() {
                    studentAttempts = model;
                  });
                });
                widget.startExam();
              },
              endExam: widget.endExam,
              setStartedAtMessage: widget.setStartedAtMessage,
              startedAtMessage: widget.examStartedAt,
            ),
            ExamManagementRightSection(
              key: ValueKey(studentAttempts.length),
              studentList: studentAttempts,
            )
          ],
        ))
      ],
    );
  }
}
