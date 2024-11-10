// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestModelImpl _$$TestModelImplFromJson(Map<String, dynamic> json) =>
    _$TestModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      duration: (json['duration'] as num).toInt(),
      groupOneTestFileUri: json['groupOneTestFileUri'] as String,
      groupTwoTestFileUri: json['groupTwoTestFileUri'] as String,
      blacklistProcessesFileName: json['blacklistProcessesFileName'] as String,
    );

Map<String, dynamic> _$$TestModelImplToJson(_$TestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'groupOneTestFileUri': instance.groupOneTestFileUri,
      'groupTwoTestFileUri': instance.groupTwoTestFileUri,
      'blacklistProcessesFileName': instance.blacklistProcessesFileName,
    };
