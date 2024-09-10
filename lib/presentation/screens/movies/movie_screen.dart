import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  final String movieId;
  static const String routeName = 'movie_screen';
  static const String routePath = 'movie/:id';
  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Id: ${widget.movieId}'),
      ),
    );
  }
}
