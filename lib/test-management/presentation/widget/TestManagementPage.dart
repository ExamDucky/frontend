import 'package:flutter/cupertino.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementMiddleSection.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementTopSection.dart';

class TestManagementPage extends StatelessWidget {
  const TestManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TestManagementTopSection(),
        TestManagementMiddleSection(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: PrimaryButton(
            onPressed: () {},
            text: "save",
            width: 200,
          ),
        )
      ],
    );
  }
}
