import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/constants/api_url.dart';
import 'package:flutter_movie_app/core/network/dio_client.dart';
import 'package:flutter_movie_app/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie_app/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie_app/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParams params);

  Future<Either> signin(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var res =
          await slGetIt<DioClient>().post(ApiUrl.signup, data: params.toMap());
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var res =
          await slGetIt<DioClient>().post(ApiUrl.signin, data: params.toMap());
      return Right(res.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
