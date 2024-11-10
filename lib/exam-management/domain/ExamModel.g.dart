// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExamModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamModelImpl _$$ExamModelImplFromJson(Map<String, dynamic> json) =>
    _$ExamModelImpl(
      groupOneTestFileUri: json['groupOneTestFileUri'] as String,
      groupTwoTestFileUri: json['groupTwoTestFileUri'] as String,
      blacklistProcessesFileName: json['blacklistProcessesFileName'] as String,
    );

Map<String, dynamic> _$$ExamModelImplToJson(_$ExamModelImpl instance) =>
    <String, dynamic>{
      'groupOneTestFileUri': instance.groupOneTestFileUri,
      'groupTwoTestFileUri': instance.groupTwoTestFileUri,
      'blacklistProcessesFileName': instance.blacklistProcessesFileName,
    };
