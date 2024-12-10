import 'package:flutter_movie_app/core/usecase/usecase.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';
import 'package:flutter_movie_app/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await slGetIt<AuthRepository>().isLoggedIn();
  }
}
