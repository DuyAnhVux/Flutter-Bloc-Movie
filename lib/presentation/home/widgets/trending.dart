import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/common/widgets/loading/loading.dart';
import 'package:flutter_movie_app/core/configs/assets/app_images.dart';
import 'package:flutter_movie_app/presentation/home/bloc/trending_cubit.dart';
import 'package:flutter_movie_app/presentation/home/bloc/trending_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const BasicLoading();
          }
          if (state is TrendingMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies
                  .map((item) =>
                      AppImages.movieImageBasePath + item.posterPath.toString())
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is FailureLoadTrendingMovies) {
            return Center(child: Text(state.errMessage));
          }
          return Container();
        },
      ),
    );
  }
}
