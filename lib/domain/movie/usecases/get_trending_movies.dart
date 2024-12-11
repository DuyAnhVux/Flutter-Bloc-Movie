import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/usecase/usecase.dart';
import 'package:flutter_movie_app/domain/movie/repositories/movie.dart';
import 'package:flutter_movie_app/service_locator.dart';

class GetTrendingMoviesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await slGetIt<MovieRepository>().getTrendingMovies();
  }
}
