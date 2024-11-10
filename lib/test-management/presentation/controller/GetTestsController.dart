import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/test-management/data/TestRepository.dart';

class GetTestsController extends StateNotifier<AsyncValue<dynamic>> {
  GetTestsController({required this.testRepository})
      : super(const AsyncData<void>(null));

  final TestRepository testRepository;

  Future<dynamic> getTests({required String testQuery}) async {
    state = const AsyncLoading<dynamic>();
    state = await AsyncValue.guard<dynamic>(
        () => testRepository.getSearchTest(testQuery: testQuery));
  }
}
