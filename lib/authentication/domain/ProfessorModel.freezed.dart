// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ProfessorModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfessorModel _$ProfessorModelFromJson(Map<String, dynamic> json) {
  return _ProfessorModel.fromJson(json);
}

/// @nodoc
mixin _$ProfessorModel {
  String get token => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  /// Serializes this ProfessorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfessorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfessorModelCopyWith<ProfessorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessorModelCopyWith<$Res> {
  factory $ProfessorModelCopyWith(
          ProfessorModel value, $Res Function(ProfessorModel) then) =
      _$ProfessorModelCopyWithImpl<$Res, ProfessorModel>;
  @useResult
  $Res call({String token, String email, String firstName, String lastName});
}

/// @nodoc
class _$ProfessorModelCopyWithImpl<$Res, $Val extends ProfessorModel>
    implements $ProfessorModelCopyWith<$Res> {
  _$ProfessorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfessorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfessorModelImplCopyWith<$Res>
    implements $ProfessorModelCopyWith<$Res> {
  factory _$$ProfessorModelImplCopyWith(_$ProfessorModelImpl value,
          $Res Function(_$ProfessorModelImpl) then) =
      __$$ProfessorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String email, String firstName, String lastName});
}

/// @nodoc
class __$$ProfessorModelImplCopyWithImpl<$Res>
    extends _$ProfessorModelCopyWithImpl<$Res, _$ProfessorModelImpl>
    implements _$$ProfessorModelImplCopyWith<$Res> {
  __$$ProfessorModelImplCopyWithImpl(
      _$ProfessorModelImpl _value, $Res Function(_$ProfessorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfessorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$ProfessorModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfessorModelImpl implements _ProfessorModel {
  _$ProfessorModelImpl(
      {required this.token,
      required this.email,
      required this.firstName,
      required this.lastName});

  factory _$ProfessorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfessorModelImplFromJson(json);

  @override
  final String token;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'ProfessorModel(token: $token, email: $email, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfessorModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, email, firstName, lastName);

  /// Create a copy of ProfessorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfessorModelImplCopyWith<_$ProfessorModelImpl> get copyWith =>
      __$$ProfessorModelImplCopyWithImpl<_$ProfessorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfessorModelImplToJson(
      this,
    );
  }
}

abstract class _ProfessorModel implements ProfessorModel {
  factory _ProfessorModel(
      {required final String token,
      required final String email,
      required final String firstName,
      required final String lastName}) = _$ProfessorModelImpl;

  factory _ProfessorModel.fromJson(Map<String, dynamic> json) =
      _$ProfessorModelImpl.fromJson;

  @override
  String get token;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;

  /// Create a copy of ProfessorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfessorModelImplCopyWith<_$ProfessorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
