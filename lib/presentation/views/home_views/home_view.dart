import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/presentation/providers/movies/movies_providers.dart';
import 'package:movies/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:movies/presentation/widgets/custom_appbar.dart';
import 'package:movies/presentation/widgets/movie_horizontal_listview.dart';
import 'package:movies/presentation/widgets/movies_slideshow.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlideshow = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          title: CustomAppbar(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: nowPlayingMoviesSlideshow),
                  MovieHorizontalListview(
                      movies: nowPlayingMovies,
                      title: 'In theaters',
                      subtitle: 'Sat 07',
                      loadNextPage: () {
                        ref
                            .read(nowPlayingMoviesProvider.notifier)
                            .loadNextPage();
                      }),
                  MovieHorizontalListview(
                      movies: upcomingMovies,
                      title: 'Coming soon',
                      subtitle: 'This month',
                      loadNextPage: () {
                        ref
                            .read(upcomingMoviesProvider.notifier)
                            .loadNextPage();
                      }),
                  MovieHorizontalListview(
                      movies: popularMovies,
                      title: 'Popular',
                      loadNextPage: () {
                        ref.read(popularMoviesProvider.notifier).loadNextPage();
                      }),
                  MovieHorizontalListview(
                      movies: topRatedMovies,
                      title: 'Best rated',
                      subtitle: 'All time',
                      loadNextPage: () {
                        ref
                            .read(topRatedMoviesProvider.notifier)
                            .loadNextPage();
                      }),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
