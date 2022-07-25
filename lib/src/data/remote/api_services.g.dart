// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// *************************************************************************
// RetrofitGenerator
// *************************************************************************

class _ApiServices implements ApiServices {
  _ApiServices(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.ktc.com/ktcBooking/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<String>> versionCheck(versionNumber, type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'versionNumber': versionNumber, 'vtype': type};
    final _result = await _dio.fetch<String>(
        _setStreamType<HttpResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/VersionUpdate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
