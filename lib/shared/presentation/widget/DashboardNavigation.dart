import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/authentication/presentation/widget/AuthPage.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/ExamManagementPage.dart';
import 'package:smart_usb_desktop/process-monitoring/presentation/widget/ProcessMonitoringPage.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/NavigationButton.dart';
import 'package:smart_usb_desktop/shared/view-models/DashboardButtonModel.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementPage.dart';

class DashboardNavigation extends ConsumerStatefulWidget {
  const DashboardNavigation(
      {super.key,
      required this.isGalleryOpened,
      required this.setIsGalleryOpen});

  final bool isGalleryOpened;
  final void Function(bool) setIsGalleryOpen;

  @override
  ConsumerState<DashboardNavigation> createState() =>
      _DashboardNavigationState();
}

class _DashboardNavigationState extends ConsumerState<DashboardNavigation> {
  bool isExamStarted = false;
  String examStartedAt = "";
  int examRemainingTimeInSeconds = 0;
  int examTotalTimeInSeconds = 0;

  List<DashboardButtonModel> dashboardButtonModels = [];

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer(int minutes) {
    setState(() {
      examTotalTimeInSeconds = minutes * 60;
      examRemainingTimeInSeconds = examTotalTimeInSeconds;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (examRemainingTimeInSeconds > 0) {
        setState(() {
          examRemainingTimeInSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isProfessorValidated = ref.watch(isProfessorValidatedProvider);

    PageType selectedPageType = ref.watch(selectedPageTypeProvider);

    dashboardButtonModels = [
      DashboardButtonModel(
        imagePath: isProfessorValidated ? "assets/images/document.png" : null,
        isSelected: selectedPageType == PageType.TestManagement,
        pageType: PageType.TestManagement,
      ),
      DashboardButtonModel(
        imagePath: isProfessorValidated ? "assets/images/grading.png" : null,
        isSelected: selectedPageType == PageType.ExamManagement,
        pageType: PageType.ExamManagement,
      ),
      DashboardButtonModel(
        imagePath: isProfessorValidated ? "assets/images/visibility.png" : null,
        isSelected: selectedPageType == PageType.ProcessMonitoring,
        pageType: PageType.ProcessMonitoring,
      ),
      DashboardButtonModel(
        imagePath: "assets/images/person.png",
        isSelected: selectedPageType == PageType.Authentication,
        pageType: PageType.Authentication,
      ),
    ];

    return Stack(
      children: [
        Row(
          children: [
            for (int i = 0; i < dashboardButtonModels.length; i++)
              NavigationButton(
                  onPressed: ref.watch(isProfessorValidatedProvider)
                      ? () {
                          setState(() {
                            ref.read(selectedPageTypeProvider.notifier).state =
                                dashboardButtonModels[i].pageType;
                          });
                        }
                      : null,
                  imagePath: dashboardButtonModels[i].imagePath,
                  isClicked: dashboardButtonModels[i].isSelected,
                  indexOfButton: i + 1)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: IndexedStack(
              index: dashboardButtonModels
                  .indexWhere((button) => button.pageType == selectedPageType),
              children: [
                const TestManagementPage(),
                ExamManagementPage(
                  endExam: () {
                    setState(() {
                      isExamStarted = false;
                    });
                  },
                  cancelTimer: () {
                    _timer?.cancel();
                  },
                  examStartedAt: examStartedAt,
                  examRemainingTime: examRemainingTimeInSeconds,
                  isExamStarted: isExamStarted,
                  examTotalTime: examTotalTimeInSeconds,
                  startTimer: startTimer,
                  setStartedAtMessage: (String newValue) {
                    setState(() {
                      examStartedAt = newValue;
                    });
                  },
                  startExam: () {
                    setState(() {
                      isExamStarted = true;
                    });
                  },
                ),
                ProcessMonitoringPage(
                  key: ValueKey(1),
                  setIsGalleryOpen: widget.setIsGalleryOpen,
                  isGalleryOpened: widget.isGalleryOpened,
                  isExamStarted: isExamStarted,
                  examRemainingTime: examRemainingTimeInSeconds,
                  examStartedAt: examStartedAt,
                ),
                const Center(child: AuthPage()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
