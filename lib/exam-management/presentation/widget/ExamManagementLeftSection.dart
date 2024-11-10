import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_usb_desktop/exam-management/domain/ExamIdModel.dart';
import 'package:smart_usb_desktop/exam-management/domain/ExamModel.dart';
import 'package:smart_usb_desktop/exam-management/presentation/utils/DirectoryHandlingUtils.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/ExamManagementPage.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/TestInformationItem.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputIconField.dart';
import 'package:smart_usb_desktop/shared/providers/Providers.dart';
import 'package:smart_usb_desktop/test-management/domain/TestListModel.dart';
import 'package:smart_usb_desktop/test-management/domain/TestModel.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestSearchItem.dart';

class ExamManagementLeftSection extends ConsumerStatefulWidget {
  const ExamManagementLeftSection(
      {super.key,
      required this.startTimer,
      required this.startedAtMessage,
      required this.setStartedAtMessage,
      required this.cancelTimer,
      required this.startExam,
      required this.endExam});

  final void Function(int) startTimer;
  final void Function() cancelTimer;
  final String startedAtMessage;
  final void Function(String) setStartedAtMessage;
  final void Function() startExam;
  final void Function() endExam;

  @override
  ConsumerState<ExamManagementLeftSection> createState() =>
      _ExamManagementLeftSectionState();
}

class _ExamManagementLeftSectionState
    extends ConsumerState<ExamManagementLeftSection>
    with DirectoryHandlingUtils {
  bool isTestSelected = false;
  bool isExamStarted = false;
  TestModel? testModel;
  List<TestModel> testList = [];
  TextEditingController testNameController = TextEditingController();
  bool isSearchExpanded = true;
  Random random = Random();
  String classroomName = "";
  ExamModel? examModel;

  @override
  void initState() {
    classroomName = "Classroom no.${random.nextInt(100) + 1}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(getExamDetailsControllerProvider);
    ref.watch(postCreateExamControllerProvider);

    ref.listen(getTestSearchControllerProvider, (_, state) {
      if (state.hasValue && state.value is TestListModel) {
        TestListModel testListModel = state.value as TestListModel;
        setState(() {
          testList = testListModel.tests;
        });
      }
    });

    ref.listen(getExamDetailsControllerProvider, (_, state) {
      if (state.hasValue && state.value is ExamModel) {
        setState(() {
          examModel = state.value;
        });
      }
    });

    ref.listen(postCreateExamControllerProvider, (_, state) {
      if (state.hasValue && state.value is ExamIdModel) {
        ref.read(examIdProvider.notifier).state =
            (state.value as ExamIdModel).id;
      }
    });

    return SizedBox(
      width: 300,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInputIconField(
                icon: Icons.search,
                width: 280,
                labelText: "search for an existing test",
                onIconTap: () {
                  ref.read(getTestSearchControllerProvider.notifier).getTests(
                      testQuery: testNameController.value.text.trim());
                  setState(() {
                    isSearchExpanded = true;
                  });
                },
                onTap: () {
                  setState(() {
                    isSearchExpanded = !isSearchExpanded;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "selected test",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                  child: Container(
                      width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: !isTestSelected
                          ? Center(
                              child: Text(
                                "No test selected",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      testModel!.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TestInformationItem(
                                        imagePath: "assets/images/clock.png",
                                        title:
                                            "${testModel!.duration.toString()} min"),
                                    TestInformationItem(
                                        imagePath: "assets/images/location.png",
                                        title: classroomName),
                                  ],
                                ),
                                Column(
                                  children: [
                                    TestInformationItem(
                                        imagePath: "assets/images/zip.png",
                                        title: testModel!.groupOneTestFileUri),
                                    TestInformationItem(
                                        imagePath: "assets/images/zip.png",
                                        title: testModel!.groupTwoTestFileUri),
                                    TestInformationItem(
                                        imagePath: "assets/images/document.png",
                                        title: testModel!
                                            .blacklistProcessesFileName),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                )
                              ],
                            ))),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                width: 280,
                onPressed: () async {
                  if (!isExamStarted) {
                    widget.startExam();
                    widget.startTimer(testModel!.duration);
                    widget.setStartedAtMessage(
                        "Started at: ${DateFormat('HH:mm.ss').format(DateTime.now().toLocal())}");
                  } else {
                    widget.cancelTimer();
                  }
                  if (!isExamStarted) {
                    downloadFile(
                        examModel!.groupOneTestFileUri, "exam.zip", context);
                    await ref
                        .read(postCreateExamControllerProvider.notifier)
                        .postStartExam(
                            testId: testModel!.id,
                            classroomName: classroomName);
                  }
                  setState(() {
                    isExamStarted = !isExamStarted;
                  });
                },
                text: isExamStarted ? "END EXAM" : "START EXAM",
              ),
              widget.startedAtMessage != ""
                  ? Text(
                      widget.startedAtMessage,
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  : Container()
            ],
          ),
          isSearchExpanded
              ? Positioned(
                  top: 50,
                  child: Container(
                    height:
                        testList.length * 80 < 350 ? testList.length * 80 : 350,
                    width: 280,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).canvasColor, width: 2),
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: testList
                            .map((e) => testList.indexOf(e) ==
                                    testList.length - 1
                                ? TestSearchItem(
                                    title: e.title,
                                    onTap: () async {
                                      await ref
                                          .read(getExamDetailsControllerProvider
                                              .notifier)
                                          .getExamDetails(testId: e.id);
                                      setState(() {
                                        isSearchExpanded = false;
                                        testModel = e;
                                        isTestSelected = true;
                                      });
                                    })
                                : Column(
                                    children: [
                                      TestSearchItem(
                                          title: e.title,
                                          onTap: () {
                                            setState(() {
                                              isSearchExpanded = false;
                                              testModel = e;
                                              isTestSelected = true;
                                            });
                                          }),
                                      Divider(
                                        thickness: 2,
                                        color: Theme.of(context).canvasColor,
                                      )
                                    ],
                                  ))
                            .toList(),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
