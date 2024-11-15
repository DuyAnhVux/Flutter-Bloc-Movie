import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/data/auth/models/user_req_params.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserReqParams params) async {
    throw UnimplementedError();
  }
}
