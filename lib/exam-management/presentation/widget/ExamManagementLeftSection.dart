import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_usb_desktop/exam-management/presentation/widget/TestInformationItem.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputIconField.dart';

class ExamManagementLeftSection extends StatefulWidget {
  const ExamManagementLeftSection(
      {super.key,
      required this.startTimer,
      required this.startedAtMessage,
      required this.setStartedAtMessage,
      required this.startExam});

  final void Function(int) startTimer;
  final String startedAtMessage;
  final void Function(String) setStartedAtMessage;
  final void Function() startExam;

  @override
  State<ExamManagementLeftSection> createState() =>
      _ExamManagementLeftSectionState();
}

class _ExamManagementLeftSectionState extends State<ExamManagementLeftSection> {
  bool isTestSelected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextInputIconField(
            icon: Icons.search,
            labelText: "search for an existing test",
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
                  width: 300,
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
                                  "Programing 2 - Second semester",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TestInformationItem(
                                    imagePath: "assets/images/clock.png",
                                    title: "180 min"),
                                TestInformationItem(
                                    imagePath: "assets/images/location.png",
                                    title: "RC-211")
                              ],
                            ),
                            Column(
                              children: [
                                TestInformationItem(
                                    imagePath: "assets/images/zip.png",
                                    title: "P2G1.zip"),
                                TestInformationItem(
                                    imagePath: "assets/images/zip.png",
                                    title: "P2G2.zip"),
                                TestInformationItem(
                                    imagePath: "assets/images/zip.png",
                                    title: "P2G1_unit.zip"),
                                TestInformationItem(
                                    imagePath: "assets/images/zip.png",
                                    title: "P2G2_unit.zip"),
                                TestInformationItem(
                                    imagePath: "assets/images/document.png",
                                    title: "blacklist.txt"),
                                SizedBox(
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
            width: 300,
            onPressed: () {
              widget.startExam();
              widget.startTimer(180);
              widget.setStartedAtMessage(
                  "Started at: ${DateFormat('HH:mm.ss').format(DateTime.now().toLocal())}");
            },
            text: "START EXAM",
          ),
          widget.startedAtMessage != ""
              ? Text(
                  widget.startedAtMessage,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              : Container()
        ],
      ),
    );
  }
}
