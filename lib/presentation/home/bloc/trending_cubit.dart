import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:flutter_movie_app/presentation/home/bloc/trending_state.dart';
import 'package:flutter_movie_app/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var data = await slGetIt<GetTrendingMoviesUseCase>().call();

    data.fold((err) {
      emit(FailureLoadTrendingMovies(errMessage: err));
    }, (data) {
      emit(TrendingMoviesLoaded(movies: data));
    });
  }
}
