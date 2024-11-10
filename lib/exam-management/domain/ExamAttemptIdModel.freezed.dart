// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ExamAttemptIdModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamAttemptIdModel _$ExamAttemptIdModelFromJson(Map<String, dynamic> json) {
  return _ExamAttemptIdModel.fromJson(json);
}

/// @nodoc
mixin _$ExamAttemptIdModel {
  int get id => throw _privateConstructorUsedError;

  /// Serializes this ExamAttemptIdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamAttemptIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamAttemptIdModelCopyWith<ExamAttemptIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamAttemptIdModelCopyWith<$Res> {
  factory $ExamAttemptIdModelCopyWith(
          ExamAttemptIdModel value, $Res Function(ExamAttemptIdModel) then) =
      _$ExamAttemptIdModelCopyWithImpl<$Res, ExamAttemptIdModel>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ExamAttemptIdModelCopyWithImpl<$Res, $Val extends ExamAttemptIdModel>
    implements $ExamAttemptIdModelCopyWith<$Res> {
  _$ExamAttemptIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamAttemptIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamAttemptIdModelImplCopyWith<$Res>
    implements $ExamAttemptIdModelCopyWith<$Res> {
  factory _$$ExamAttemptIdModelImplCopyWith(_$ExamAttemptIdModelImpl value,
          $Res Function(_$ExamAttemptIdModelImpl) then) =
      __$$ExamAttemptIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ExamAttemptIdModelImplCopyWithImpl<$Res>
    extends _$ExamAttemptIdModelCopyWithImpl<$Res, _$ExamAttemptIdModelImpl>
    implements _$$ExamAttemptIdModelImplCopyWith<$Res> {
  __$$ExamAttemptIdModelImplCopyWithImpl(_$ExamAttemptIdModelImpl _value,
      $Res Function(_$ExamAttemptIdModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamAttemptIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ExamAttemptIdModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamAttemptIdModelImpl implements _ExamAttemptIdModel {
  _$ExamAttemptIdModelImpl({required this.id});

  factory _$ExamAttemptIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamAttemptIdModelImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'ExamAttemptIdModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamAttemptIdModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ExamAttemptIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamAttemptIdModelImplCopyWith<_$ExamAttemptIdModelImpl> get copyWith =>
      __$$ExamAttemptIdModelImplCopyWithImpl<_$ExamAttemptIdModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamAttemptIdModelImplToJson(
      this,
    );
  }
}

abstract class _ExamAttemptIdModel implements ExamAttemptIdModel {
  factory _ExamAttemptIdModel({required final int id}) =
      _$ExamAttemptIdModelImpl;

  factory _ExamAttemptIdModel.fromJson(Map<String, dynamic> json) =
      _$ExamAttemptIdModelImpl.fromJson;

  @override
  int get id;

  /// Create a copy of ExamAttemptIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamAttemptIdModelImplCopyWith<_$ExamAttemptIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
