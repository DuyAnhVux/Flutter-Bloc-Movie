import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/data/auth/models/user_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(UserReqParams params);
}
