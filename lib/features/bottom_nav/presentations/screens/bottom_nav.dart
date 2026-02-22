import 'package:flutter/material.dart';
import 'package:flutter_test_project/generated/assets.dart';

import '../providers/bottom_nav_provider.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      const NavItemData(
        icon: Assets.nutritionBlack,
        selectedIcon: Assets.nutritionWhite,
        label: 'Nutrition',
      ),
      const NavItemData(
        icon: Assets.calenderBlack,
        selectedIcon: Assets.calenderWhite,
        label: 'Plan',
      ),
      const NavItemData(
        icon: Assets.emojiBlack,
        selectedIcon: Assets.emojiWhite,
        label: 'Mood',
      ),
      const NavItemData(
        icon: Assets.personIcon,
        selectedIcon: Assets.personIcon,
        label: 'Profile',
      ),
    ];

    return BottomNavWidget(
      items: items,
      selectedIndex: selectedIndex,
      onItemSelected: onItemSelected,
    );
  }
}
