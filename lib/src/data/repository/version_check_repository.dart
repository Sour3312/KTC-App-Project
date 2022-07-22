
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_ktc_booking/src/core/resources/data_state.dart';
import 'package:flutter_ktc_booking/src/data/remote/api_services.dart';
import 'package:flutter_ktc_booking/src/domain/repository/version_check_repository.dart';
import 'package:retrofit/retrofit.dart';

class VersionCheckRepositoryImpl implements VersionCheckRepository {
  final ApiServices _apiServices;

  const VersionCheckRepositoryImpl(this._apiServices);

  @override
  Future<DataState<String>> versionCheck(String version) async {
    try {
      final httpResponse = await _apiServices.versionCheck(version, "android");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.response.data);
      }
      return DataError(DioError(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage));
    } on DioError catch (e) {
      return DataError(e);
    }
  }
}
