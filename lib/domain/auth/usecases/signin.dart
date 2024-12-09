import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/usecase/usecase.dart';
import 'package:flutter_movie_app/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';
import 'package:flutter_movie_app/service_locator.dart';

class SigninUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await slGetIt<AuthRepository>().signin(params!);
  }
}
