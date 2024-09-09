import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final String movieId;
  static const String routeName = 'movie_screen';
  static const String routePath = 'movie/:id';
  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Id: $movieId'),
      ),
    );
  }
}
