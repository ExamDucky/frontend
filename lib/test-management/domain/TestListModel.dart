import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_usb_desktop/test-management/domain/TestModel.dart';

part 'TestListModel.freezed.dart';

part 'TestListModel.g.dart';

@freezed
class TestListModel with _$TestListModel {
  factory TestListModel({required List<TestModel> tests}) = _TestListModel;

  factory TestListModel.fromJson(Map<String, dynamic> json) =>
      _$TestListModelFromJson(json);
}
