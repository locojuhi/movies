import 'package:go_router/go_router.dart';
import 'package:movies/presentation/screens/movies/home_screen.dart';
import 'package:movies/presentation/screens/movies/movie_screen.dart';

final appRouter = GoRouter(
  initialLocation: HomeScreen.routePath,
  routes: [
    GoRoute(
        path: HomeScreen.routePath,
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
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
