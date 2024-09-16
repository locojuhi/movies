import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustonBottomNavigation extends StatelessWidget {
  const CustonBottomNavigation({super.key});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/');
        break;
      case 2:
        context.go('/favorites');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favorites',
        ),
      ],
    );
  }
}
