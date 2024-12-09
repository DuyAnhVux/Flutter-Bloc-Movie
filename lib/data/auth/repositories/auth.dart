import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie_app/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie_app/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';
import 'package:flutter_movie_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    return await slGetIt<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await slGetIt<AuthApiService>().signin(params);
  }
}
