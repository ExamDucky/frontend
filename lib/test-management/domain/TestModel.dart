import 'package:freezed_annotation/freezed_annotation.dart';

part 'TestModel.freezed.dart';

part 'TestModel.g.dart';

@freezed
class TestModel with _$TestModel {
  factory TestModel(
      {required int id,
      required String title,
      required int duration,
      required String groupOneTestFileUri,
      required String groupTwoTestFileUri,
      required String blacklistProcessesFileName}) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
