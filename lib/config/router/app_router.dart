import 'package:go_router/go_router.dart';
import 'package:movies/presentation/screens/movies/home_screen.dart';
import 'package:movies/presentation/screens/movies/movie_screen.dart';
import 'package:movies/presentation/views/home_views/favorites_view.dart';
import 'package:movies/presentation/views/home_views/home_view.dart';

final appRouter = GoRouter(
  initialLocation: HomeScreen.routePath,
  routes: [
    GoRoute(
        path: HomeScreen.routePath,
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(
              childView: HomeView(),
            ),
        routes: [
          GoRoute(
            path: MovieScreen.routePath,
            name: MovieScreen.routeName,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no_id';
              return MovieScreen(
                movieId: movieId,
              );
            },
          ),
        ]),
  ],
);
