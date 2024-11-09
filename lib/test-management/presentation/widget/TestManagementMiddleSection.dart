import 'package:flutter/cupertino.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputField.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementUploadFiles.dart';

class TestManagementMiddleSection extends StatelessWidget {
  const TestManagementMiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextInputField(
                    labelText: "test name",
                    width: null,
                  ),
                )),
            Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextInputField(
                    labelText: "description",
                    width: null,
                  ),
                )),
            Flexible(
                flex: 3,
                child: TextInputField(
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
                    child: TestManagementUploadFiles(title: "test files [zip]", uploadType: UploadType.Test,),
                  )),
              Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TestManagementUploadFiles(title: "unit tests [zip]", uploadType: UploadType.UnitTest,),
                  )),
              Flexible(
                  flex: 3,
                  child: TestManagementUploadFiles(
                      title: "process blacklist [txt]",
                  uploadType: UploadType.ProcessBlacklist,))
            ],
          ),
        )
      ],
    );
  }
}
