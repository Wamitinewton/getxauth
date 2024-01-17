import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarUtil {
  static List<BottomNavigationBarItem> getBottomNavBarItems() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
      BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
      BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'My Courses'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    ];
  }

  static void _handleTabTap(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/student');
        break;
      case 1:
        Get.toNamed('/dashboard');
        break;
      case 2:
        Get.toNamed('/my_courses');
        break;
      case 3:
        Get.toNamed('/profile');
        break;
      case 4:
        Get.toNamed('/settings');
        break;
    }
  }

  static BottomNavigationBar buildBottomNavBar() {
    return BottomNavigationBar(
      items: getBottomNavBarItems(),
      currentIndex: 0,
      onTap: _handleTabTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
    );
  }
}
