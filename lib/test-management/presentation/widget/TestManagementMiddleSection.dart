import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputField.dart';
import 'package:smart_usb_desktop/shared/providers/Providers.dart';
import 'package:smart_usb_desktop/test-management/domain/TestModel.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementPage.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementUploadFiles.dart';

class TestManagementMiddleSection extends ConsumerStatefulWidget {
  const TestManagementMiddleSection({super.key, required this.testModel});

  final TestModel? testModel;

  @override
  ConsumerState<TestManagementMiddleSection> createState() =>
      _TestManagementMiddleSectionState();
}

class _TestManagementMiddleSectionState
    extends ConsumerState<TestManagementMiddleSection> {
  final TextEditingController testNameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  String groupOneTestFileName = "";
  String groupTwoTestFileName = "";
  String blacklistProcessesFileName = "";
  Uint8List? groupOneContent;
  Uint8List? groupTwoContent;
  Uint8List? processesContent;

  // String? isTestNameValid(String? value) {
  //   bool valid = value != null && value.isNotEmpty;
  //   if (!valid) {
  //     return "Test name has to be longer than 1 character";
  //   }
  //   return null;
  // }
  //
  // String? isDurationValid(String? value) {
  //   final regex = RegExp(r'^[1-9][0-9]*$');
  //
  //   if (value == null || value.isEmpty) {
  //     return 'This field cannot be empty';
  //   } else if (!regex.hasMatch(value)) {
  //     return 'Please enter a number greater than zero';
  //   }
  //   return null;
  // }

  @override
  void initState() {
    if (widget.testModel != null) {
      testNameController.value =
          TextEditingValue(text: widget.testModel!.title);
      durationController.value =
          TextEditingValue(text: widget.testModel!.duration.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(postCreateTestControllerProvider);
    ref.watch(putUploadTestControllerProvider);

    ref.listen(postCreateTestControllerProvider, (_, state) async {
      if (state.hasValue && state.value is TestModel) {
        var test = state.value as TestModel;
        await ref.read(putUploadTestControllerProvider.notifier).putUploadTest(
            testFileType: "GroupOne",
            fileName: groupOneTestFileName,
            fileContent: groupOneContent!,
            testId: test.id);
        await ref.read(putUploadTestControllerProvider.notifier).putUploadTest(
            fileName: groupTwoTestFileName,
            testFileType: "GroupTwo",
            fileContent: groupTwoContent!,
            testId: test.id);
        await ref.read(putUploadTestControllerProvider.notifier).putUploadTest(
            fileName: blacklistProcessesFileName,
            testFileType: "ProcessBlacklist",
            fileContent: processesContent!,
            testId: test.id);
        setState(() {
          testNameController.clear();
          durationController.clear();
        });
        ref.read(testManagementPageTypeProvider.notifier).state =
            TestManagementPageType.NoTestSelected;
      }
    });

    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TextInputField(
                      controller: testNameController,
                      labelText: "test name",
                      width: null,
                    ),
                  )),
              const SizedBox(
                width: 200,
              ),
              Flexible(
                  flex: 3,
                  child: TextInputField(
                    controller: durationController,
                    labelText: "duration [min]",
                    width: null,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TestManagementUploadFiles(
                        testModel: widget.testModel,
                        setProcessContent: (value) {
                          processesContent = value;
                        },
                        setTestOneContent: (value) {
                          groupOneContent = value;
                        },
                        setTestTwoContent: (value) {
                          groupTwoContent = value;
                        },
                        setProcessName: (value) {},
                        setTestOneName: (value) {
                          setState(() {
                            groupOneTestFileName = value;
                          });
                        },
                        setTestTwoName: (value) {
                          setState(() {
                            groupTwoTestFileName = value;
                          });
                        },
                        title: "test files [zip]",
                        uploadType: UploadType.Test,
                      ),
                    )),
                const SizedBox(
                  width: 200,
                ),
                Flexible(
                    flex: 3,
                    child: TestManagementUploadFiles(
                      testModel: widget.testModel,
                      setProcessContent: (value) {
                        processesContent = value;
                      },
                      setTestOneContent: (value) {
                        groupOneContent = value;
                      },
                      setTestTwoContent: (value) {
                        groupTwoContent = value;
                      },
                      setTestTwoName: (value) {},
                      setTestOneName: (value) {},
                      setProcessName: (value) {
                        setState(() {
                          blacklistProcessesFileName = value;
                        });
                      },
                      title: "process blacklist [txt]",
                      uploadType: UploadType.ProcessBlacklist,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ref.watch(testManagementPageTypeProvider) ==
                    TestManagementPageType.CreateNew
                ? PrimaryButton(
                    onPressed: () {
                      ref
                          .read(postCreateTestControllerProvider.notifier)
                          .postCreateTest(
                            title: testNameController.value.text.trim(),
                            duration: 100,
                            groupOneTestFileUri: groupOneTestFileName,
                            groupTwoTestFileUri: groupTwoTestFileName,
                            blacklistProcessesFileName:
                                blacklistProcessesFileName,
                          );
                    },
                    text: "save",
                    width: 200,
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
