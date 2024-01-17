import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/pages/studentpages/views/dashboard_page.dart';
import 'package:test_project/pages/studentpages/views/mycourses_page.dart';
import 'package:test_project/pages/studentpages/views/profile_page.dart';
import 'package:test_project/pages/studentpages/views/settings_page.dart';

import '../views/courses_page.dart';

class NavBarController extends GetxController {
  final List<Widget> pages = [
   const CoursesPage(),
   const DashboardPage(),
   const MyCourses(),
   const ProfilePage(),
   const SettingsPage(),

  ];

  final RxInt selectedIndex = 0.obs;

  Widget get currentScreen => pages[selectedIndex.value];
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}