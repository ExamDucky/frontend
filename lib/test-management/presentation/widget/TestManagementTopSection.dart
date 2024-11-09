import 'package:flutter/material.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputIconField.dart';

class TestManagementTopSection extends StatelessWidget {
  const TestManagementTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: [
          Text("TEST MANAGEMENT",
          style: Theme.of(context).textTheme.labelLarge,),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextInputIconField(
                icon: Icons.search,
                labelText: "search for an existing test",
              ),
              PrimaryButton(
                onPressed: () {},
                text: "create new test",
                width: 270,
              ),
            ],
          )
        ],
      ),
    );
  }
}
