// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ExamModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamModel _$ExamModelFromJson(Map<String, dynamic> json) {
  return _ExamModel.fromJson(json);
}

/// @nodoc
mixin _$ExamModel {
  String get groupOneTestFileUri => throw _privateConstructorUsedError;
  String get groupTwoTestFileUri => throw _privateConstructorUsedError;
  String get blacklistProcessesFileName => throw _privateConstructorUsedError;

  /// Serializes this ExamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamModelCopyWith<ExamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamModelCopyWith<$Res> {
  factory $ExamModelCopyWith(ExamModel value, $Res Function(ExamModel) then) =
      _$ExamModelCopyWithImpl<$Res, ExamModel>;
  @useResult
  $Res call(
      {String groupOneTestFileUri,
      String groupTwoTestFileUri,
      String blacklistProcessesFileName});
}

/// @nodoc
class _$ExamModelCopyWithImpl<$Res, $Val extends ExamModel>
    implements $ExamModelCopyWith<$Res> {
  _$ExamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupOneTestFileUri = null,
    Object? groupTwoTestFileUri = null,
    Object? blacklistProcessesFileName = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$ExamModelImplCopyWith<$Res>
    implements $ExamModelCopyWith<$Res> {
  factory _$$ExamModelImplCopyWith(
          _$ExamModelImpl value, $Res Function(_$ExamModelImpl) then) =
      __$$ExamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String groupOneTestFileUri,
      String groupTwoTestFileUri,
      String blacklistProcessesFileName});
}

/// @nodoc
class __$$ExamModelImplCopyWithImpl<$Res>
    extends _$ExamModelCopyWithImpl<$Res, _$ExamModelImpl>
    implements _$$ExamModelImplCopyWith<$Res> {
  __$$ExamModelImplCopyWithImpl(
      _$ExamModelImpl _value, $Res Function(_$ExamModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupOneTestFileUri = null,
    Object? groupTwoTestFileUri = null,
    Object? blacklistProcessesFileName = null,
  }) {
    return _then(_$ExamModelImpl(
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
class _$ExamModelImpl implements _ExamModel {
  _$ExamModelImpl(
      {required this.groupOneTestFileUri,
      required this.groupTwoTestFileUri,
      required this.blacklistProcessesFileName});

  factory _$ExamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamModelImplFromJson(json);

  @override
  final String groupOneTestFileUri;
  @override
  final String groupTwoTestFileUri;
  @override
  final String blacklistProcessesFileName;

  @override
  String toString() {
    return 'ExamModel(groupOneTestFileUri: $groupOneTestFileUri, groupTwoTestFileUri: $groupTwoTestFileUri, blacklistProcessesFileName: $blacklistProcessesFileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamModelImpl &&
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
  int get hashCode => Object.hash(runtimeType, groupOneTestFileUri,
      groupTwoTestFileUri, blacklistProcessesFileName);

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamModelImplCopyWith<_$ExamModelImpl> get copyWith =>
      __$$ExamModelImplCopyWithImpl<_$ExamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamModelImplToJson(
      this,
    );
  }
}

abstract class _ExamModel implements ExamModel {
  factory _ExamModel(
      {required final String groupOneTestFileUri,
      required final String groupTwoTestFileUri,
      required final String blacklistProcessesFileName}) = _$ExamModelImpl;

  factory _ExamModel.fromJson(Map<String, dynamic> json) =
      _$ExamModelImpl.fromJson;

  @override
  String get groupOneTestFileUri;
  @override
  String get groupTwoTestFileUri;
  @override
  String get blacklistProcessesFileName;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamModelImplCopyWith<_$ExamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
