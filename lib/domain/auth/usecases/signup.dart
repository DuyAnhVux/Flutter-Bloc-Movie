import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/usecase/usecase.dart';
import 'package:flutter_movie_app/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';
import 'package:flutter_movie_app/service_locator.dart';

class SignupUseCase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await slGetIt<AuthRepository>().signup(params!);
  }
}
