import 'package:dio/dio.dart';
import 'package:flutter_ktc_booking/src/core/bloc/bloc_state.dart';
import 'package:flutter_ktc_booking/src/core/resources/data_state.dart';
import 'package:flutter_ktc_booking/src/domain/usecase/version_check_use_case.dart';
import 'version_check_event.dart';
import 'version_check_state.dart';

class VersionCheckBloc
    extends BlocWithState<VersionCheckEvent, VersionCheckState> {
  final VersionCheckUseCase _versionCheckUseCase;

  VersionCheckBloc(this._versionCheckUseCase)
      : super(const VersionCheckLoading()) {
    on<VersionCheckEvent>((event, emit) async {
      final dataState = await _versionCheckUseCase.call(params: event.version);
      if (dataState is DataSuccess) {
        emit(VersionCheckSuccess(dataState.data!));
      } else if (dataState is DataError) {
        emit(VersionCheckError(dataState.error!));
      }
    });
  }

  // @override
  // Stream<VersionCheckState> mapEventToState(VersionCheckEvent event) async* {
  //   if (event is VersionCheck) yield* _versionCheck(event);
  // }

  // Stream<VersionCheckState> _versionCheck(VersionCheck event) async* {
  //   yield* runBlocProcess(() async* {
  //     final dataState = await _versionCheckUseCase.call(params: event.version);
  //     if (dataState is DataSuccess) {
  //       yield VersionCheckSuccess(dataState.data!);
  //     } else if (dataState is DataError) {
  //       yield VersionCheckError(dataState.error!);
  //     }
  //   });
  // }
}
