// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfessorModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfessorModelImpl _$$ProfessorModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfessorModelImpl(
      token: json['token'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$$ProfessorModelImplToJson(
        _$ProfessorModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
