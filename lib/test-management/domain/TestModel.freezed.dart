// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TestModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return _TestModel.fromJson(json);
}

/// @nodoc
mixin _$TestModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get groupOneTestFileUri => throw _privateConstructorUsedError;
  String get groupTwoTestFileUri => throw _privateConstructorUsedError;
  String get blacklistProcessesFileName => throw _privateConstructorUsedError;

  /// Serializes this TestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestModelCopyWith<TestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestModelCopyWith<$Res> {
  factory $TestModelCopyWith(TestModel value, $Res Function(TestModel) then) =
      _$TestModelCopyWithImpl<$Res, TestModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      int duration,
      String groupOneTestFileUri,
      String groupTwoTestFileUri,
      String blacklistProcessesFileName});
}

/// @nodoc
class _$TestModelCopyWithImpl<$Res, $Val extends TestModel>
    implements $TestModelCopyWith<$Res> {
  _$TestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? duration = null,
    Object? groupOneTestFileUri = null,
    Object? groupTwoTestFileUri = null,
    Object? blacklistProcessesFileName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      groupOneTestFileUri: null == groupOneTestFileUri
          ? _value.groupOneTestFileUri
          : groupOneTestFileUri // ignore: cast_nullable_to_non_nullable
              as String,
      groupTwoTestFileUri: null == groupTwoTestFileUri
          ? _value.groupTwoTestFileUri
          : groupTwoTestFileUri // ignore: cast_nullable_to_non_nullable
              as String,
      blacklistProcessesFileName: null == blacklistProcessesFileName
          ? _value.blacklistProcessesFileName
          : blacklistProcessesFileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestModelImplCopyWith<$Res>
    implements $TestModelCopyWith<$Res> {
  factory _$$TestModelImplCopyWith(
          _$TestModelImpl value, $Res Function(_$TestModelImpl) then) =
      __$$TestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      int duration,
      String groupOneTestFileUri,
      String groupTwoTestFileUri,
      String blacklistProcessesFileName});
}

/// @nodoc
class __$$TestModelImplCopyWithImpl<$Res>
    extends _$TestModelCopyWithImpl<$Res, _$TestModelImpl>
    implements _$$TestModelImplCopyWith<$Res> {
  __$$TestModelImplCopyWithImpl(
      _$TestModelImpl _value, $Res Function(_$TestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? duration = null,
    Object? groupOneTestFileUri = null,
    Object? groupTwoTestFileUri = null,
    Object? blacklistProcessesFileName = null,
  }) {
    return _then(_$TestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      groupOneTestFileUri: null == groupOneTestFileUri
          ? _value.groupOneTestFileUri
          : groupOneTestFileUri // ignore: cast_nullable_to_non_nullable
              as String,
      groupTwoTestFileUri: null == groupTwoTestFileUri
          ? _value.groupTwoTestFileUri
          : groupTwoTestFileUri // ignore: cast_nullable_to_non_nullable
              as String,
      blacklistProcessesFileName: null == blacklistProcessesFileName
          ? _value.blacklistProcessesFileName
          : blacklistProcessesFileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestModelImpl implements _TestModel {
  _$TestModelImpl(
      {required this.id,
      required this.title,
      required this.duration,
      required this.groupOneTestFileUri,
      required this.groupTwoTestFileUri,
      required this.blacklistProcessesFileName});

  factory _$TestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final int duration;
  @override
  final String groupOneTestFileUri;
  @override
  final String groupTwoTestFileUri;
  @override
  final String blacklistProcessesFileName;

  @override
  String toString() {
    return 'TestModel(id: $id, title: $title, duration: $duration, groupOneTestFileUri: $groupOneTestFileUri, groupTwoTestFileUri: $groupTwoTestFileUri, blacklistProcessesFileName: $blacklistProcessesFileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.groupOneTestFileUri, groupOneTestFileUri) ||
                other.groupOneTestFileUri == groupOneTestFileUri) &&
            (identical(other.groupTwoTestFileUri, groupTwoTestFileUri) ||
                other.groupTwoTestFileUri == groupTwoTestFileUri) &&
            (identical(other.blacklistProcessesFileName,
                    blacklistProcessesFileName) ||
                other.blacklistProcessesFileName ==
                    blacklistProcessesFileName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, duration,
      groupOneTestFileUri, groupTwoTestFileUri, blacklistProcessesFileName);

  /// Create a copy of TestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestModelImplCopyWith<_$TestModelImpl> get copyWith =>
      __$$TestModelImplCopyWithImpl<_$TestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestModelImplToJson(
      this,
    );
  }
}

abstract class _TestModel implements TestModel {
  factory _TestModel(
      {required final int id,
      required final String title,
      required final int duration,
      required final String groupOneTestFileUri,
      required final String groupTwoTestFileUri,
      required final String blacklistProcessesFileName}) = _$TestModelImpl;

  factory _TestModel.fromJson(Map<String, dynamic> json) =
      _$TestModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  int get duration;
  @override
  String get groupOneTestFileUri;
  @override
  String get groupTwoTestFileUri;
  @override
  String get blacklistProcessesFileName;

  /// Create a copy of TestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestModelImplCopyWith<_$TestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
