
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class VersionCheckState extends Equatable {
  final String? versionDetail;
  final DioError? error;
  const VersionCheckState({this.versionDetail, this.error});

  @override
  List<Object?> get props => [versionDetail, error];
}

class VersionCheckLoading extends VersionCheckState {
  const VersionCheckLoading();
}

class VersionCheckSuccess extends VersionCheckState {
  const VersionCheckSuccess(String versionDetail): super(versionDetail: versionDetail);
}

class VersionCheckError extends VersionCheckState {
  const VersionCheckError(DioError error): super(error: error);
}