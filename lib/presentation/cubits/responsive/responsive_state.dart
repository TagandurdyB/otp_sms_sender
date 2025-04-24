part of 'responsive_cubit.dart';

@freezed
class ResponsiveState with _$ResponsiveState {
  const factory ResponsiveState.loading() = _ResponsiveLoading;
  const factory ResponsiveState.ready({
   @Default(Orientation.portrait) Orientation orientation,
   @Default(BoxConstraints()) BoxConstraints constraints,
  @Default(Device.mobile) Device device,
  }) = _ResponsiveReady;
}
