import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/shared/presentation/widget/PrimaryButton.dart';
import 'package:smart_usb_desktop/shared/providers/Providers.dart';
import 'package:smart_usb_desktop/test-management/domain/TestListModel.dart';
import 'package:smart_usb_desktop/test-management/domain/TestModel.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementMiddleSection.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestManagementTopSection.dart';
import 'package:smart_usb_desktop/test-management/presentation/widget/TestSearchItem.dart';

enum TestManagementPageType { NoTestSelected, CreateNew, SelectedTest }

final testManagementPageTypeProvider = StateProvider<TestManagementPageType>(
    (ref) => TestManagementPageType.NoTestSelected);

final selectedTestProvider = StateProvider<TestModel?>((ref) => null);

class TestManagementPage extends ConsumerStatefulWidget {
  const TestManagementPage({super.key});

  @override
  ConsumerState<TestManagementPage> createState() => _TestManagementPageState();
}

class _TestManagementPageState extends ConsumerState<TestManagementPage> {
  List<TestModel> testList = [];

  bool isSearchExpanded = true;


  @override
  Widget build(BuildContext context) {

    final test = ref.watch(selectedTestProvider);
    final TestManagementPageType testManagementPageType =
        ref.watch(testManagementPageTypeProvider);

    final testListState = ref.watch(getTestSearchControllerProvider);

    ref.listen(getTestSearchControllerProvider, (_, state) {
      if (state.hasValue && state.value is TestListModel) {
        TestListModel testListModel = state.value as TestListModel;
        setState(() {
          testList = testListModel.tests;
        });
      }
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 20.0),
      child: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSearchExpanded = false;
                  });
                },
                child: TestManagementTopSection(
                  isSearchSelected: isSearchExpanded,
                  searchSelected: (value) {
                    setState(() {
                      isSearchExpanded = value;
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSearchExpanded = false;
                    setState(() {
                      isSearchExpanded = false;
                    });
                  });
                },
                child: testManagementPageType ==
                        TestManagementPageType.NoTestSelected
                    ? Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Center(
                            child: Text(
                          "Search for an existing test or create new one",
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                      )
                    : testManagementPageType ==
                            TestManagementPageType.CreateNew
                        ? const TestManagementMiddleSection(testModel: null,)
                        : TestManagementMiddleSection(testModel: test, key: ValueKey(test?.id),),
              )
            ],
          ),
          isSearchExpanded
              ? Positioned(
                  top: 100,
                  child: Container(
                    height:
                        testList.length * 80 < 350 ? testList.length * 80 : 350,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).canvasColor, width: 2),
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: testList
                            .map((e) => testList.indexOf(e) ==
                                    testList.length - 1
                                ? TestSearchItem(
                                    title: e.title,
                                    onTap: () {
                                      setState(() {
                                        isSearchExpanded = false;
                                        ref
                                            .read(
                                            selectedTestProvider.notifier)
                                            .state = e;                                      });
                                      ref
                                              .read(
                                                  testManagementPageTypeProvider
                                                      .notifier)
                                              .state =
                                          TestManagementPageType.SelectedTest;
                                    })
                                : Column(
                                    children: [
                                      TestSearchItem(
                                          title: e.title,
                                          onTap: () {
                                            setState(() {
                                              isSearchExpanded = false;
                                              ref
                                                  .read(
                                                  selectedTestProvider.notifier)
                                                  .state = e;                                            });
                                            ref
                                                    .read(
                                                        testManagementPageTypeProvider
                                                            .notifier)
                                                    .state =
                                                TestManagementPageType
                                                    .SelectedTest;
                                          }),
                                      Divider(
                                        thickness: 2,
                                        color: Theme.of(context).canvasColor,
                                      )
                                    ],
                                  ))
                            .toList(),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
