import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: "https://www.ktc.com/ktcBooking/")
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST("api/VersionUpdate")
  Future<HttpResponse<String>> versionCheck(@Field("versionNumber") String versionNumber, @Field('vtype') String type);
}