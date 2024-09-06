import 'package:flutter/material.dart';
import 'package:movies/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  static const routePath = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.theMovieDBAccessKey),
      ),
    );
  }
}
