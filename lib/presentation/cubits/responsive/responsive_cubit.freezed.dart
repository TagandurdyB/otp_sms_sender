// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'responsive_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponsiveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Orientation orientation, BoxConstraints constraints, Device device)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            Orientation orientation, BoxConstraints constraints, Device device)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            Orientation orientation, BoxConstraints constraints, Device device)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponsiveLoading value) loading,
    required TResult Function(_ResponsiveReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponsiveLoading value)? loading,
    TResult? Function(_ResponsiveReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponsiveLoading value)? loading,
    TResult Function(_ResponsiveReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponsiveStateCopyWith<$Res> {
  factory $ResponsiveStateCopyWith(
          ResponsiveState value, $Res Function(ResponsiveState) then) =
      _$ResponsiveStateCopyWithImpl<$Res, ResponsiveState>;
}

/// @nodoc
class _$ResponsiveStateCopyWithImpl<$Res, $Val extends ResponsiveState>
    implements $ResponsiveStateCopyWith<$Res> {
  _$ResponsiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponsiveState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResponsiveLoadingImplCopyWith<$Res> {
  factory _$$ResponsiveLoadingImplCopyWith(_$ResponsiveLoadingImpl value,
          $Res Function(_$ResponsiveLoadingImpl) then) =
      __$$ResponsiveLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResponsiveLoadingImplCopyWithImpl<$Res>
    extends _$ResponsiveStateCopyWithImpl<$Res, _$ResponsiveLoadingImpl>
    implements _$$ResponsiveLoadingImplCopyWith<$Res> {
  __$$ResponsiveLoadingImplCopyWithImpl(_$ResponsiveLoadingImpl _value,
      $Res Function(_$ResponsiveLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponsiveState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResponsiveLoadingImpl implements _ResponsiveLoading {
  const _$ResponsiveLoadingImpl();

  @override
  String toString() {
    return 'ResponsiveState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResponsiveLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Orientation orientation, BoxConstraints constraints, Device device)
        ready,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            Orientation orientation, BoxConstraints constraints, Device device)?
        ready,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            Orientation orientation, BoxConstraints constraints, Device device)?
        ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponsiveLoading value) loading,
    required TResult Function(_ResponsiveReady value) ready,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponsiveLoading value)? loading,
    TResult? Function(_ResponsiveReady value)? ready,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponsiveLoading value)? loading,
    TResult Function(_ResponsiveReady value)? ready,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ResponsiveLoading implements ResponsiveState {
  const factory _ResponsiveLoading() = _$ResponsiveLoadingImpl;
}

/// @nodoc
abstract class _$$ResponsiveReadyImplCopyWith<$Res> {
  factory _$$ResponsiveReadyImplCopyWith(_$ResponsiveReadyImpl value,
          $Res Function(_$ResponsiveReadyImpl) then) =
      __$$ResponsiveReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Orientation orientation, BoxConstraints constraints, Device device});
}

/// @nodoc
class __$$ResponsiveReadyImplCopyWithImpl<$Res>
    extends _$ResponsiveStateCopyWithImpl<$Res, _$ResponsiveReadyImpl>
    implements _$$ResponsiveReadyImplCopyWith<$Res> {
  __$$ResponsiveReadyImplCopyWithImpl(
      _$ResponsiveReadyImpl _value, $Res Function(_$ResponsiveReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponsiveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orientation = null,
    Object? constraints = null,
    Object? device = null,
  }) {
    return _then(_$ResponsiveReadyImpl(
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as BoxConstraints,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc

class _$ResponsiveReadyImpl implements _ResponsiveReady {
  const _$ResponsiveReadyImpl(
      {this.orientation = Orientation.portrait,
      this.constraints = const BoxConstraints(),
      this.device = Device.mobile});

  @override
  @JsonKey()
  final Orientation orientation;
  @override
  @JsonKey()
  final BoxConstraints constraints;
  @override
  @JsonKey()
  final Device device;

  @override
  String toString() {
    return 'ResponsiveState.ready(orientation: $orientation, constraints: $constraints, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponsiveReadyImpl &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.constraints, constraints) ||
                other.constraints == constraints) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orientation, constraints, device);

  /// Create a copy of ResponsiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponsiveReadyImplCopyWith<_$ResponsiveReadyImpl> get copyWith =>
      __$$ResponsiveReadyImplCopyWithImpl<_$ResponsiveReadyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Orientation orientation, BoxConstraints constraints, Device device)
        ready,
  }) {
    return ready(orientation, constraints, device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            Orientation orientation, BoxConstraints constraints, Device device)?
        ready,
  }) {
    return ready?.call(orientation, constraints, device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            Orientation orientation, BoxConstraints constraints, Device device)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(orientation, constraints, device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResponsiveLoading value) loading,
    required TResult Function(_ResponsiveReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResponsiveLoading value)? loading,
    TResult? Function(_ResponsiveReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResponsiveLoading value)? loading,
    TResult Function(_ResponsiveReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _ResponsiveReady implements ResponsiveState {
  const factory _ResponsiveReady(
      {final Orientation orientation,
      final BoxConstraints constraints,
      final Device device}) = _$ResponsiveReadyImpl;

  Orientation get orientation;
  BoxConstraints get constraints;
  Device get device;

  /// Create a copy of ResponsiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponsiveReadyImplCopyWith<_$ResponsiveReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
