import 'package:flutter_movie_app/core/network/dio_client.dart';
import 'package:flutter_movie_app/data/auth/repositories/auth.dart';
import 'package:flutter_movie_app/data/auth/sources/auth_service.dart';
import 'package:flutter_movie_app/data/movie/repositories/movie.dart';
import 'package:flutter_movie_app/data/movie/sources/movie_service.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';
import 'package:flutter_movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_movie_app/domain/auth/usecases/signin.dart';
import 'package:flutter_movie_app/domain/auth/usecases/signup.dart';
import 'package:flutter_movie_app/domain/movie/repositories/movie.dart';
import 'package:flutter_movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:get_it/get_it.dart';

final slGetIt = GetIt.instance;

void setupServiceLocator() {
  slGetIt.registerSingleton<DioClient>(DioClient());

  //Services
  slGetIt.registerSingleton<AuthService>(AuthApiServiceImpl());
  slGetIt.registerSingleton<MovieService>(MovieApiServiceImpl());

  //Repositories
  slGetIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  slGetIt.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  //Usecases
  slGetIt.registerSingleton<SignupUseCase>(SignupUseCase());
  slGetIt.registerSingleton<SigninUseCase>(SigninUseCase());
  slGetIt.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  slGetIt
      .registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}
