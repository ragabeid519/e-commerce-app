import 'package:fire_base_project2/generated/l10n.dart';
import 'package:fire_base_project2/ui/cart_items.dart';
import 'package:fire_base_project2/ui/producr_app.dart';
import 'package:fire_base_project2/ui/profile_page.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatelessWidget {
  int pageIndex = 0;

  Bottomnavbar({super.key, required this.pageIndex});

  final List<Widget> _pages = [ProfilePage(), ProductApp(), CartItems()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        pageIndex = value;
        if (pageIndex == 0) {
          Navigator.pushNamed(context, '/product');
        } else if (pageIndex == 1) {
          Navigator.pushNamed(context, '/cart');
        } else if (pageIndex == 2) {
          Navigator.pushNamed(context, '/favorite');
        } else if (pageIndex == 3) {
          Navigator.pushNamed(context, '/profile');
        }
      },
      currentIndex: pageIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),

          label: S.of(context).home,
        ),
        // add  nav bar for cart items
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: S.of(context).cart,
        ),
        // add  nav bar for fovorites
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: S.of(context).favorite,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),

          label: S.of(context).profile,
        ),
      ],
    );
  }
}
