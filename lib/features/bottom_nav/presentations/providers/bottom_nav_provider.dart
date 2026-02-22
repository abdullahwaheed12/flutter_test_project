import 'package:flutter/material.dart';

class NavItemData {
  final String icon;
  final String selectedIcon;
  final String label;

  const NavItemData({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

class BottomNavProvider extends ChangeNotifier {
  int selectedIndex = 0;

  List<NavItemData> items;

  BottomNavProvider({required this.items});

  void select(int index) {
    if (index == selectedIndex) return;
    selectedIndex = index;
    notifyListeners();
  }
}
