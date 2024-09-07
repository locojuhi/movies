import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/presentation/providers/movies/movies_providers.dart';
import 'package:movies/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:movies/presentation/widgets/custom_appbar.dart';
import 'package:movies/presentation/widgets/custon_bottom_navigation.dart';
import 'package:movies/presentation/widgets/movie_horizontal_listview.dart';
import 'package:movies/presentation/widgets/movies_slideshow.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  static const routePath = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustonBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    //final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlideshow = ref.watch(moviesSlideshowProvider);

    return Column(
      children: [
        const CustomAppbar(),
        MoviesSlideshow(movies: nowPlayingMoviesSlideshow),
        MovieHorizontalListview(
          movies: nowPlayingMoviesSlideshow,
          title: 'In theaters',
          subtitle: 'Sat 07',
        ),
        Expanded(
          child: ListView.builder(
            itemCount: nowPlayingMoviesSlideshow.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = nowPlayingMoviesSlideshow[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          ),
        ),
      ],
    );
  }
}
