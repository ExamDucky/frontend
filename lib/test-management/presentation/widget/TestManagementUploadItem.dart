import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementUploadFiles.dart';
import 'package:smart_usb_desktop/test-management/presentation/utils/FileUploadUtils.dart';

class TestManagementUploadItem extends StatefulWidget {
  const TestManagementUploadItem(
      {super.key,
      required this.uploadType,
      required this.testTitle,
      required this.index});

  final UploadType uploadType;
  final String testTitle;
  final int index;

  @override
  State<TestManagementUploadItem> createState() =>
      _TestManagementUploadItemState();
}

class _TestManagementUploadItemState extends State<TestManagementUploadItem>
    with FileUploadUtils {
  double importPercent = 0;
  Uint8List? fileContent;
  String fileName = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: widget.uploadType == UploadType.UnitTest ||
                widget.uploadType == UploadType.Test
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "group ${widget.index}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        fileName != ""
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Image.asset("assets/images/zip.png",
                                        height: 25, width: 25),
                                  ),
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      fileName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            : Text(
                                "Upload ${widget.testTitle}",
                                style: Theme.of(context).textTheme.labelSmall ,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7))),
                              child: IconButton(
                                  onPressed: () async {
                                    Uint8List? fc = await pickFile(
                                        setProgressPercent:
                                            (int readBytes, totalBytes) {
                                      setState(() {
                                        importPercent = readBytes / totalBytes;
                                      });
                                    }, setFileName: (String name) {
                                      setState(() {
                                        fileName = name;
                                      });
                                    });

                                    if (fileName != "" &&
                                        !fileName.endsWith(".zip")) {
                                      showIncorrectFormatDialog(
                                          context, fileName, ".zip");
                                      setState(() {
                                        fileContent = null;
                                        fileName = "";
                                        importPercent = 0;
                                      });
                                    } else {
                                      setState(() {
                                        fileContent = fc;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.more_horiz_outlined,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ),
                            fileName != ""
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            importPercent = 0;
                                            fileName = "";
                                            fileContent = null;
                                          });
                                        },
                                        child: Image.asset(
                                            "assets/images/trash.png",
                                            height: 25,
                                            width: 25)),
                                  )
                                : Container()
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  importPercent == 0 || importPercent == 1
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Image.asset(
                                "assets/images/document.png",
                                width: 50,
                                height: 50,
                                color: fileName == ""
                                    ? null
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 7.0, top: 3.0),
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  fileName == ""
                                      ? "select blacklist"
                                      : fileName,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                        child: IconButton(
                            onPressed: () async {
                              Uint8List? fc = await pickFile(setProgressPercent:
                                  (int readBytes, totalBytes) {
                                setState(() {
                                  importPercent = readBytes / totalBytes;
                                });
                              }, setFileName: (String name) {
                                setState(() {
                                  fileName = name;
                                });
                              });

                              if (fileName != "" &&
                                  !fileName.endsWith(".txt")) {
                                showIncorrectFormatDialog(
                                    context, fileName, ".txt");
                                setState(() {
                                  fileContent = null;
                                  fileName = "";
                                  importPercent = 0;
                                });
                              } else {
                                setState(() {
                                  fileContent = fc;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.more_horiz_outlined,
                              size: 15,
                              color: Theme.of(context).primaryColor,
                            )),
                      ),
                      fileName != ""
                          ? Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      importPercent = 0;
                                      fileName = "";
                                      fileContent = null;
                                    });
                                  },
                                  child: Image.asset("assets/images/trash.png",
                                      height: 25, width: 25)),
                            )
                          : Container()
                    ],
                  )
                ],
              ));
  }
}
