import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/TextInputIconField.dart';
import 'package:smart_usb_desktop/shared/providers/Providers.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementPage.dart';

class TestManagementTopSection extends ConsumerStatefulWidget {
  const TestManagementTopSection({super.key, required this.searchSelected, required this.isSearchSelected});

  final void Function(bool) searchSelected;
  final bool isSearchSelected;

  @override
  ConsumerState<TestManagementTopSection> createState() =>
      _TestManagementTopSectionState();
}

class _TestManagementTopSectionState
    extends ConsumerState<TestManagementTopSection> {
  TextEditingController testNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Text(
            "TEST MANAGEMENT",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInputIconField(
                onIconTap: (){
                  ref
                      .read(getTestSearchControllerProvider.notifier)
                      .getTests(testQuery: testNameController.value.text.trim());
                  widget.searchSelected(true);
                },
                onTap: () {
                  widget.searchSelected(!widget.isSearchSelected);
                },
                controller: testNameController,
                icon: Icons.search,
                labelText: "search for an existing test",
              ),
              PrimaryButton(
                onPressed: () {
                  widget.searchSelected(false);
                  ref.read(testManagementPageTypeProvider.notifier).state =
                      TestManagementPageType.CreateNew;
                },
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
