import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/constants/enums.dart';

part 'responsive_state.dart';
part 'responsive_cubit.freezed.dart';

class ResponsiveCubit extends Cubit<ResponsiveState> {
  ResponsiveCubit() : super(const ResponsiveState.loading());
  void init() => emit(const ResponsiveState.ready());

  void changeValues({
    Orientation? orientation,
    BoxConstraints? constraints,
  }) {
    state.map(
      loading: (_) {},
      ready: (value) {
        final orien = orientation ?? Orientation.portrait;
        final constr = constraints ?? const BoxConstraints();
        emit(value.copyWith(
          device: chagneDevice(orien, constr),
          orientation: orien,
          constraints: constr,
        ));
      },
    );
  }

  Device chagneDevice(Orientation orientation, BoxConstraints constraints) {
    switch (constraints.maxWidth) {
      case > 1024:
        return Device.desktop;
      case > 768:
        {
          if (orientation == Orientation.portrait) {
            return Device.tablet;
          }
          return Device.desktop;
        }
      default:
        {
          if (orientation == Orientation.portrait) {
            return Device.mobile;
          }
          return Device.tablet;
        }
    }
  }
}
