import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/common/widgets/ui_image.dart';

import '../../../../core/utils/app_colors.dart';
import '../providers/bottom_nav_provider.dart';

class BottomNavWidget extends StatelessWidget {
  final List<NavItemData> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNavWidget({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: const Border(
          top: BorderSide(color: Colors.white10, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == selectedIndex;
          final color = isSelected ? Colors.white : Colors.white54;

          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIImage.svgAsset(
                  isSelected ? item.selectedIcon : item.icon,
                  height: 22.sp,
                ),
                SizedBox(height: 4.h),
                Text(
                  item.label,
                  style: TextStyle(
                    color: color,
                    fontSize: 11.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                if (isSelected) ...[
                  SizedBox(height: 3.h),
                  Container(
                    width: 18.w,
                    height: 2.h,
                    decoration: BoxDecoration(
                      color: AppColors.accentGreen,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                  ),
                ],
              ],
            ),
          );
        }),
      ),
    );
  }
}
