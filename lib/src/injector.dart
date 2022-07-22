import 'package:dio/dio.dart';
import 'package:flutter_ktc_booking/src/data/remote/api_services.dart';
import 'package:flutter_ktc_booking/src/data/repository/version_check_repository.dart';
import 'package:flutter_ktc_booking/src/domain/repository/version_check_repository.dart';
import 'package:flutter_ktc_booking/src/domain/usecase/version_check_use_case.dart';
import 'package:flutter_ktc_booking/src/presentation/bloc/versioncheck/version_check_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initialiseDependency() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<ApiServices>(ApiServices(injector()));

  //VersionCheckRepository
  injector.registerSingleton<VersionCheckRepository>(
      VersionCheckRepositoryImpl(injector()));

  //Version Check Use Case
  injector.registerSingleton<VersionCheckUseCase>(VersionCheckUseCase(injector()));

  //Version Check Bloc
  injector.registerSingleton<VersionCheckBloc>(VersionCheckBloc(injector()));
}
