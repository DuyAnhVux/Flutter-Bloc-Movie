import 'package:flutter/material.dart';
import 'package:flutter_movie_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_movie_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_movie_app/presentation/home/widgets/category_text.dart';
import 'package:flutter_movie_app/presentation/home/widgets/trending.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings 🔥'),
            TrendingMovies(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
