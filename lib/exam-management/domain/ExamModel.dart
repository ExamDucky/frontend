import 'package:freezed_annotation/freezed_annotation.dart';

part 'ExamModel.freezed.dart';

part 'ExamModel.g.dart';

@freezed
class ExamModel with _$ExamModel {
  factory ExamModel(
      {required String groupOneTestFileUri,
        required String groupTwoTestFileUri,
        required String blacklistProcessesFileName}) = _ExamModel;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);
}
