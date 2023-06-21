import 'package:flutter/material.dart';
import 'package:store/const/AppColors.dart';
import 'package:store/ui/bottom_nav_pages/cart.dart';
import 'package:store/ui/bottom_nav_pages/favourite.dart';
import 'package:store/ui/bottom_nav_pages/home.dart';
import 'package:store/ui/bottom_nav_pages/profile.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  final _pages = [
    Home(),
    Favourite(),
    Cart(),
    Profile(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "NecoShop",
          style: TextStyle(color: Colors.deepPurple),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: Colors.deepPurpleAccent,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Главная",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Избранное"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Корзина",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профиль",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
