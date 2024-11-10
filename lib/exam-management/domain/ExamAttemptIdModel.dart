import 'package:freezed_annotation/freezed_annotation.dart';

part 'ExamAttemptIdModel.freezed.dart';

part 'ExamAttemptIdModel.g.dart';

@freezed
class ExamAttemptIdModel with _$ExamAttemptIdModel {
  factory ExamAttemptIdModel({
    required int id,
  }) = _ExamAttemptIdModel;

  factory ExamAttemptIdModel.fromJson(Map<String, dynamic> json) =>
      _$ExamAttemptIdModelFromJson(json);
}
