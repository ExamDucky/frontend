import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementUploadItem.dart';

enum UploadType { Test, UnitTest, ProcessBlacklist }

class TestManagementUploadFiles extends StatefulWidget {
  const TestManagementUploadFiles(
      {super.key, required this.title, required this.uploadType});

  final String title;
  final UploadType uploadType;

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
          height: 140,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: widget.uploadType == UploadType.Test
                ? [
                    TestManagementUploadItem(
                      testTitle: "group 1",
                      index: 1,
                      key: UniqueKey(),
                      uploadType: widget.uploadType,
                    ),
                    TestManagementUploadItem(
                        testTitle: "group 2",
                        index: 2,
                        key: UniqueKey(),
                        uploadType: widget.uploadType)
                  ]
                : widget.uploadType == UploadType.UnitTest
                    ? [
                        TestManagementUploadItem(
                          testTitle: "unit test 1",
                          index: 1,
                          key: UniqueKey(),
                          uploadType: widget.uploadType,
                        ),
                        TestManagementUploadItem(
                            testTitle: "unit test 2",
                            index: 2,
                            key: UniqueKey(),
                            uploadType: widget.uploadType)
                      ]
                    : [
                        TestManagementUploadItem(
                            key: UniqueKey(),
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
