import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/common/widgets/ui_image.dart';
import 'package:flutter_test_project/generated/assets.dart';

import '../../../../core/utils/app_colors.dart';

class CalendarStrip extends StatelessWidget {
  final DateTime startOfWeek;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onSelected;

  const CalendarStrip({
    super.key,
    required this.startOfWeek,
    required this.selectedDate,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    const weekdayLabels = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];

    return Column(
      children: [
        SizedBox(
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              final date = startOfWeek.add(Duration(days: index));
              final isSelected =
                  date.year == selectedDate.year &&
                  date.month == selectedDate.month &&
                  date.day == selectedDate.day;

              return GestureDetector(
                onTap: () => onSelected(date),
                child: Column(
                  children: [
                    Text(
                      weekdayLabels[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? AppColors.accentGreenSoft
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.accentGreen
                              : Colors.white12,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString().padLeft(2, '0'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (isSelected) ...[
                      SizedBox(height: 6.h),
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accentGreen,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 8.h),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 36.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String dateLabel;
  final String title;

  const WorkoutCard({super.key, required this.dateLabel, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7.w,
          height: 84.h,
          decoration: BoxDecoration(
            color: AppColors.accentTeal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dateLabel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '550',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 6.w),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Text(
                    'Calories',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              '1950 Remaining',
              style: TextStyle(
                color: AppColors.neutralGray,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: TextStyle(
                    color: AppColors.neutralGray,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '2500',
                  style: TextStyle(
                    color: AppColors.neutralGray,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Stack(
              children: [
                Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999.r),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.caloriesGradientLightBlue,
                          AppColors.caloriesGradientTeal,
                          AppColors.caloriesGradientGreen,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeightCard extends StatelessWidget {
  const WeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '75',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4.h),
                Text(
                  'kg',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                UIImage.svgAsset(Assets.arrowUp, width: 18.sp, height: 18.sp),
                SizedBox(width: 4.w),
                Text(
                  '+1.6kg',
                  style: TextStyle(
                    color: AppColors.neutralGray,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              'Weight',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HydrationCard extends StatelessWidget {
  const HydrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0%',
                              style: TextStyle(
                                color: AppColors.accentBlue,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              'Hydration',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Log Now',
                              style: TextStyle(
                                color: AppColors.neutralGray,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      SizedBox(
                        width: 150.w,
                        height: 130.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2 L',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(11, (index) {
                                    final isBlue = index == 0 || index == 5;
                                    final width = isBlue ? 12.w : 6.w;
                                    final height = isBlue ? 6.h : 3.h;

                                    return Container(
                                      width: width,
                                      height: height,
                                      decoration: BoxDecoration(
                                        color: isBlue
                                            ? AppColors.accentBlue
                                            : Colors.white24,
                                        borderRadius: BorderRadius.circular(
                                          999.r,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),

                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Text(
                                  '0 L',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Expanded(
                                  child: Container(
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(
                                        999.r,
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 12.w,
                                      height: 4.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentBlue,
                                        borderRadius: BorderRadius.circular(
                                          999.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  '0ml',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: Text(
                '500 ml added to water log',
                style: TextStyle(
                  color: Color(0xffEBEBEB),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
