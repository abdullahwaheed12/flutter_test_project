import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/common/widgets/ui_image.dart';
import 'package:flutter_test_project/core/utils/app_colors.dart';
import 'package:flutter_test_project/generated/assets.dart';
import 'package:provider/provider.dart';

import '../providers/nutrition_provider.dart';
import '../widgets/nutrition_widgets.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NutritionProvider(),
      child: const _NutritionView(),
    );
  }
}

class _NutritionView extends StatelessWidget {
  const _NutritionView();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NutritionProvider>();
    final workout = provider.selectedWorkout;
    final hour = TimeOfDay.now().hour;
    final isDayTime =
        hour >= 6 &&
        hour < 18; // if hour is between 6 and 18 then it is day time
    final weatherIcon = isDayTime ? Assets.sunWhite : Assets.moonIcon;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              UIImage.svgAsset(
                Assets.notificationIcon,
                width: 24.sp,
                height: 24.sp,
                color: Colors.white,
              ),
              const Spacer(),
              UIImage.svgAsset(
                Assets.weakIcon,
                width: 20.sp,
                height: 20.sp,
                color: Colors.white,
              ),
              SizedBox(width: 6.w),
              GestureDetector(
                onTap: () => _showMonthPicker(context, provider),
                behavior: HitTestBehavior.opaque,
                child: Row(
                  children: [
                    Text(
                      'Week ${provider.weekOfMonth}/${provider.totalWeeksInMonth}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white70,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),

          SizedBox(height: 24.h),
          Text(
            'Today, ${provider.formatFullDate(provider.selectedDate)}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 18.h),
          CalendarStrip(
            startOfWeek: provider.startOfWeek,
            selectedDate: provider.selectedDate,
            onSelected: provider.selectDate,
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Workouts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  UIImage.svgAsset(weatherIcon),
                  SizedBox(width: 6.w),
                  Text(
                    '9°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          WorkoutCard(dateLabel: workout.dateLabel, title: workout.title),
          SizedBox(height: 24.h),
          Text(
            'My Insights',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              const Expanded(child: CaloriesCard()),
              SizedBox(width: 12.w),
              const Expanded(child: WeightCard()),
            ],
          ),
          SizedBox(height: 12.h),
          const HydrationCard(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  void _showMonthPicker(BuildContext context, NutritionProvider provider) {
    final initialMonth = DateTime(
      provider.selectedDate.year,
      provider.selectedDate.month,
      1,
    );

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (bottomSheetContext) {
        DateTime visibleMonth = initialMonth;

        const weekdayLabels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

        String formatMonthYear(DateTime date) {
          const months = [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec',
          ];
          return '${months[date.month - 1]} ${date.year}';
        }

        return StatefulBuilder(
          builder: (context, setState) {
            final daysInMonth = DateTime(
              visibleMonth.year,
              visibleMonth.month + 1,
              0,
            ).day;
            final firstWeekday = visibleMonth.weekday;
            final leadingEmpty = firstWeekday - 1;

            final List<DateTime?> dayCells = List<DateTime?>.filled(
              leadingEmpty,
              null,
              growable: true,
            );

            for (var day = 1; day <= daysInMonth; day++) {
              dayCells.add(
                DateTime(visibleMonth.year, visibleMonth.month, day),
              );
            }

            return Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 16.h,
                bottom: 24.h + MediaQuery.of(context).viewPadding.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 40.w,
                      height: 4.h,
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            visibleMonth = DateTime(
                              visibleMonth.year,
                              visibleMonth.month - 1,
                              1,
                            );
                          });
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        color: Colors.white,
                        iconSize: 18,
                      ),
                      Text(
                        formatMonthYear(visibleMonth),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            visibleMonth = DateTime(
                              visibleMonth.year,
                              visibleMonth.month + 1,
                              1,
                            );
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: weekdayLabels
                        .map(
                          (label) => Expanded(
                            child: Center(
                              child: Text(
                                label,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 12.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 6.w,
                    ),
                    itemCount: dayCells.length,
                    itemBuilder: (context, index) {
                      final date = dayCells[index];
                      if (date == null) {
                        return const SizedBox.shrink();
                      }

                      final isSelected =
                          date.year == provider.selectedDate.year &&
                          date.month == provider.selectedDate.month &&
                          date.day == provider.selectedDate.day;

                      return GestureDetector(
                        onTap: () {
                          provider.selectDateFromMonth(date);
                          Navigator.of(bottomSheetContext).pop();
                        },
                        child: Center(
                          child: isSelected
                              ? Container(
                                  width: 32.w,
                                  height: 32.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: AppColors.accentGreen,
                                      width: 1.5,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${date.day}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              : Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
