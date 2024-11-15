import 'package:flutter_movie_app/core/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final slGetIt = GetIt.instance;

void setupServiceLocator() {
  slGetIt.registerSingleton<DioClient>(DioClient());
}
