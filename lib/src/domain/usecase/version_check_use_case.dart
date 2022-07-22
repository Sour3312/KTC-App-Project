
import 'package:dio/dio.dart';
import 'package:flutter_ktc_booking/src/core/resources/data_state.dart';
import 'package:flutter_ktc_booking/src/core/usecase/use_case.dart';
import 'package:flutter_ktc_booking/src/domain/repository/version_check_repository.dart';

class VersionCheckUseCase implements UseCase<DataState<String>, String> {

  final VersionCheckRepository _repository;

  VersionCheckUseCase(this._repository);

  @override
  Future<DataState<String>> call({String? params}) async {
    if(params == null) {
      return DataError(DioError(requestOptions: RequestOptions(path: "version_check")));
    }
    return _repository.versionCheck(params);
  }

}