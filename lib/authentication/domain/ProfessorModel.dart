import 'package:freezed_annotation/freezed_annotation.dart';

part 'ProfessorModel.freezed.dart';

part 'ProfessorModel.g.dart';

@freezed
class ProfessorModel with _$ProfessorModel {
  factory ProfessorModel(
      {required String token,
      required String email,
      required String firstName,
      required String lastName}) = _ProfessorModel;

  factory ProfessorModel.fromJson(Map<String, dynamic> json) => _$ProfessorModelFromJson(json);
}
