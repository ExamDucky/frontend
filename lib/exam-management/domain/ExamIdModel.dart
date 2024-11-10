import 'package:freezed_annotation/freezed_annotation.dart';

part 'ExamIdModel.freezed.dart';

part 'ExamIdModel.g.dart';

@freezed
class ExamIdModel with _$ExamIdModel {
  factory ExamIdModel({
    required int id,
  }) = _ExamIdModel;

  factory ExamIdModel.fromJson(Map<String, dynamic> json) =>
      _$ExamIdModelFromJson(json);
}
