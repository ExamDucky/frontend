import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/authentication/data/AuthRepository.dart';
import 'package:http/http.dart' as http;
import 'package:smart_usb_desktop/authentication/data/HttpAuthRepository.dart';
import 'package:smart_usb_desktop/authentication/presentation/controller/LoginController.dart';
import 'package:smart_usb_desktop/exam-management/data/ExamRepository.dart';
import 'package:smart_usb_desktop/exam-management/data/HttpExamRepository.dart';
import 'package:smart_usb_desktop/exam-management/presentation/controller/GetExamDetailController.dart';
import 'package:smart_usb_desktop/exam-management/presentation/controller/PostCreateExamAttemptController.dart';
import 'package:smart_usb_desktop/exam-management/presentation/controller/PostStartExamController.dart';
import 'package:smart_usb_desktop/main.dart';
import 'package:smart_usb_desktop/test-management/data/HttpTestRepository.dart';
import 'package:smart_usb_desktop/test-management/data/TestRepository.dart';
import 'package:smart_usb_desktop/test-management/presentation/controller/GetTestsController.dart';
import 'package:smart_usb_desktop/test-management/presentation/controller/PostCreateTestController.dart';
import 'package:smart_usb_desktop/test-management/presentation/controller/PutUploadFileController.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return HttpAuthRepository(
      client: http.Client(), domain: getCurrentProfileURL()!);
});

final postLoginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, AsyncValue<dynamic>>(
        (ref) {
  return LoginController(
    authRepository: ref.watch(authRepositoryProvider),
  );
});

final testRepositoryProvider = Provider<TestRepository>((ref) {
  return HttpTestRepository(
      client: http.Client(), domain: getCurrentProfileURL()!);
});

final getTestSearchControllerProvider =
    StateNotifierProvider.autoDispose<GetTestsController, AsyncValue<dynamic>>(
        (ref) {
  return GetTestsController(
    testRepository: ref.watch(testRepositoryProvider),
  );
});

final postCreateTestControllerProvider = StateNotifierProvider.autoDispose<
    PostCreateTestController, AsyncValue<dynamic>>((ref) {
  return PostCreateTestController(
    testRepository: ref.watch(testRepositoryProvider),
  );
});

final putUploadTestControllerProvider = StateNotifierProvider.autoDispose<
    PutUpdateFileController, AsyncValue<dynamic>>((ref) {
  return PutUpdateFileController(
    testRepository: ref.watch(testRepositoryProvider),
  );
});

final examRepositoryProvider = Provider<ExamRepository>((ref) {
  return HttpExamRepository(
      client: http.Client(), domain: getCurrentProfileURL()!);
});

final getExamDetailsControllerProvider = StateNotifierProvider.autoDispose<
    GetExamDetailsController, AsyncValue<dynamic>>((ref) {
  return GetExamDetailsController(
    examRepository: ref.watch(examRepositoryProvider),
  );
});

final postCreateExamControllerProvider = StateNotifierProvider.autoDispose<
    PostStartExamController, AsyncValue<dynamic>>((ref) {
  return PostStartExamController(
    examRepository: ref.watch(examRepositoryProvider),
  );
});


final postCreateExamAttemptControllerProvider = StateNotifierProvider.autoDispose<
    PostCreateExamAttemptController, AsyncValue<dynamic>>((ref) {
  return PostCreateExamAttemptController(
    examRepository: ref.watch(examRepositoryProvider),
  );
});