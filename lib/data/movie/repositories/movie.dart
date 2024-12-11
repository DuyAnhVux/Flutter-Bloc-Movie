import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/common/helper/mapper/movie.dart';
import 'package:flutter_movie_app/data/movie/models/movie.dart';
import 'package:flutter_movie_app/data/movie/sources/movie_service.dart';
import 'package:flutter_movie_app/domain/movie/repositories/movie.dart';
import 'package:flutter_movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var data = await slGetIt<MovieService>().getTrendingMovies();
    return data.fold((err) {
      return Left(err);
    }, (data) async {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)));
      return Right(movies);
    });
  }
}
