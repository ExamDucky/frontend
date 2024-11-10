// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestListModelImpl _$$TestListModelImplFromJson(Map<String, dynamic> json) =>
    _$TestListModelImpl(
      tests: (json['tests'] as List<dynamic>)
          .map((e) => TestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TestListModelImplToJson(_$TestListModelImpl instance) =>
    <String, dynamic>{
      'tests': instance.tests,
    };
