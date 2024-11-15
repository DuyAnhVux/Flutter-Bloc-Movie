import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/constants/api_url.dart';
import 'package:flutter_movie_app/core/network/dio_client.dart';
import 'package:flutter_movie_app/data/auth/models/user_req_params.dart';
import 'package:flutter_movie_app/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(UserReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(UserReqParams params) async {
    try {
      var res = await slGetIt<DioClient>().post(ApiUrl.signup, data: params);
      return Right(res);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
