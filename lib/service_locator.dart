import 'package:flutter_movie_app/core/network/dio_client.dart';
import 'package:flutter_movie_app/data/auth/repositories/auth.dart';
import 'package:flutter_movie_app/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';
import 'package:flutter_movie_app/domain/auth/usecases/signin.dart';
import 'package:flutter_movie_app/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final slGetIt = GetIt.instance;

void setupServiceLocator() {
  slGetIt.registerSingleton<DioClient>(DioClient());

  //Services
  slGetIt.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  //Repositories
  slGetIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Usecases
  slGetIt.registerSingleton<SignupUseCase>(SignupUseCase());
  slGetIt.registerSingleton<SigninUseCase>(SigninUseCase());
}
