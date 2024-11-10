import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/test-management/domain/TestModel.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementUploadItem.dart';

enum UploadType { Test, UnitTest, ProcessBlacklist }

class TestManagementUploadFiles extends StatefulWidget {
  const TestManagementUploadFiles(
      {super.key,
      required this.title,
      required this.uploadType,
      required this.setTestOneName,
      required this.setTestTwoName,
      required this.setProcessName,
      required this.setTestOneContent,
      required this.setTestTwoContent,
      required this.setProcessContent,
      required this.testModel});

  final String title;
  final UploadType uploadType;
  final void Function(String) setTestOneName;
  final void Function(String) setTestTwoName;
  final void Function(String) setProcessName;
  final void Function(Uint8List?) setTestOneContent;
  final void Function(Uint8List?) setTestTwoContent;
  final void Function(Uint8List?) setProcessContent;
  final TestModel? testModel;

  @override
  State<TestManagementUploadFiles> createState() =>
      _TestManagementUploadFilesState();
}

class _TestManagementUploadFilesState extends State<TestManagementUploadFiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            widget.title,
            style:
                Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
          ),
        ),
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: widget.uploadType == UploadType.Test
                ? [
                    TestManagementUploadItem(
                      fileName: widget.testModel?.groupOneTestFileUri,
                      setFileContent: widget.setTestOneContent,
                      setFileName: widget.setTestOneName,
                      testTitle: "group 1",
                      index: 1,
                      key: ValueKey(1),
                      uploadType: widget.uploadType,
                    ),
                    TestManagementUploadItem(
                        fileName: widget.testModel?.groupTwoTestFileUri,
                        setFileContent: widget.setTestTwoContent,
                        setFileName: widget.setTestTwoName,
                        testTitle: "group 2",
                        index: 2,
                        key: ValueKey(2),
                        uploadType: widget.uploadType)
                  ]
                : [
                    TestManagementUploadItem(
                        key: ValueKey(-1),
                        fileName: widget.testModel?.blacklistProcessesFileName,
                        setFileContent: widget.setProcessContent,
                        setFileName: widget.setProcessName,
                        index: -1,
                        testTitle: "",
                        uploadType: widget.uploadType)
                  ],
          ),
        )
      ],
    );
  }
}
