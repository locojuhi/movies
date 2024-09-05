import 'package:go_router/go_router.dart';
import 'package:movies/presentation/screens/movies/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: HomeScreen.routePath,
  routes: [
    GoRoute(
      path: HomeScreen.routePath,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
