import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/constants/api_url.dart';
import 'package:flutter_movie_app/core/network/dio_client.dart';
import 'package:flutter_movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var res = await slGetIt<DioClient>().get(ApiUrl.trendingMovies);
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
