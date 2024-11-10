// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TestListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestListModel _$TestListModelFromJson(Map<String, dynamic> json) {
  return _TestListModel.fromJson(json);
}

/// @nodoc
mixin _$TestListModel {
  List<TestModel> get tests => throw _privateConstructorUsedError;

  /// Serializes this TestListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestListModelCopyWith<TestListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestListModelCopyWith<$Res> {
  factory $TestListModelCopyWith(
          TestListModel value, $Res Function(TestListModel) then) =
      _$TestListModelCopyWithImpl<$Res, TestListModel>;
  @useResult
  $Res call({List<TestModel> tests});
}

/// @nodoc
class _$TestListModelCopyWithImpl<$Res, $Val extends TestListModel>
    implements $TestListModelCopyWith<$Res> {
  _$TestListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tests = null,
  }) {
    return _then(_value.copyWith(
      tests: null == tests
          ? _value.tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<TestModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestListModelImplCopyWith<$Res>
    implements $TestListModelCopyWith<$Res> {
  factory _$$TestListModelImplCopyWith(
          _$TestListModelImpl value, $Res Function(_$TestListModelImpl) then) =
      __$$TestListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TestModel> tests});
}

/// @nodoc
class __$$TestListModelImplCopyWithImpl<$Res>
    extends _$TestListModelCopyWithImpl<$Res, _$TestListModelImpl>
    implements _$$TestListModelImplCopyWith<$Res> {
  __$$TestListModelImplCopyWithImpl(
      _$TestListModelImpl _value, $Res Function(_$TestListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tests = null,
  }) {
    return _then(_$TestListModelImpl(
      tests: null == tests
          ? _value._tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<TestModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestListModelImpl implements _TestListModel {
  _$TestListModelImpl({required final List<TestModel> tests}) : _tests = tests;

  factory _$TestListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestListModelImplFromJson(json);

  final List<TestModel> _tests;
  @override
  List<TestModel> get tests {
    if (_tests is EqualUnmodifiableListView) return _tests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tests);
  }

  @override
  String toString() {
    return 'TestListModel(tests: $tests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestListModelImpl &&
            const DeepCollectionEquality().equals(other._tests, _tests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tests));

  /// Create a copy of TestListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestListModelImplCopyWith<_$TestListModelImpl> get copyWith =>
      __$$TestListModelImplCopyWithImpl<_$TestListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestListModelImplToJson(
      this,
    );
  }
}

abstract class _TestListModel implements TestListModel {
  factory _TestListModel({required final List<TestModel> tests}) =
      _$TestListModelImpl;

  factory _TestListModel.fromJson(Map<String, dynamic> json) =
      _$TestListModelImpl.fromJson;

  @override
  List<TestModel> get tests;

  /// Create a copy of TestListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestListModelImplCopyWith<_$TestListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
