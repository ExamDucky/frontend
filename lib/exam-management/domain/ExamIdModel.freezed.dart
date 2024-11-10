// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ExamIdModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamIdModel _$ExamIdModelFromJson(Map<String, dynamic> json) {
  return _ExamIdModel.fromJson(json);
}

/// @nodoc
mixin _$ExamIdModel {
  int get id => throw _privateConstructorUsedError;

  /// Serializes this ExamIdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamIdModelCopyWith<ExamIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamIdModelCopyWith<$Res> {
  factory $ExamIdModelCopyWith(
          ExamIdModel value, $Res Function(ExamIdModel) then) =
      _$ExamIdModelCopyWithImpl<$Res, ExamIdModel>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ExamIdModelCopyWithImpl<$Res, $Val extends ExamIdModel>
    implements $ExamIdModelCopyWith<$Res> {
  _$ExamIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamIdModel
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
abstract class _$$ExamIdModelImplCopyWith<$Res>
    implements $ExamIdModelCopyWith<$Res> {
  factory _$$ExamIdModelImplCopyWith(
          _$ExamIdModelImpl value, $Res Function(_$ExamIdModelImpl) then) =
      __$$ExamIdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ExamIdModelImplCopyWithImpl<$Res>
    extends _$ExamIdModelCopyWithImpl<$Res, _$ExamIdModelImpl>
    implements _$$ExamIdModelImplCopyWith<$Res> {
  __$$ExamIdModelImplCopyWithImpl(
      _$ExamIdModelImpl _value, $Res Function(_$ExamIdModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamIdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ExamIdModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamIdModelImpl implements _ExamIdModel {
  _$ExamIdModelImpl({required this.id});

  factory _$ExamIdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamIdModelImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'ExamIdModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamIdModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ExamIdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamIdModelImplCopyWith<_$ExamIdModelImpl> get copyWith =>
      __$$ExamIdModelImplCopyWithImpl<_$ExamIdModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamIdModelImplToJson(
      this,
    );
  }
}

abstract class _ExamIdModel implements ExamIdModel {
  factory _ExamIdModel({required final int id}) = _$ExamIdModelImpl;

  factory _ExamIdModel.fromJson(Map<String, dynamic> json) =
      _$ExamIdModelImpl.fromJson;

  @override
  int get id;

  /// Create a copy of ExamIdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamIdModelImplCopyWith<_$ExamIdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
