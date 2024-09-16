import 'package:flutter/material.dart';
import 'package:movies/presentation/widgets/custon_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  static const routePath = '/';
  final Widget childView;

  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: childView,
      ),
      bottomNavigationBar: const CustonBottomNavigation(),
    );
  }
}
