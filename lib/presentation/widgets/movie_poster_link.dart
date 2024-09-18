import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/domain/entities/movie.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/movie/${movie.id}'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(movie.posterPath),
      ),
    );
  }
}
