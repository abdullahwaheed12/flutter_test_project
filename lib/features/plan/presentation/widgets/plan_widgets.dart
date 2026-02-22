import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/common/widgets/ui_image.dart';
import 'package:flutter_test_project/generated/assets.dart';

import '../../../../core/utils/app_colors.dart';

class WeekHeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String totalLabel;

  const WeekHeaderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.totalLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Color(0xff121212),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle,
                style: TextStyle(color: Color(0xff7A7C90), fontSize: 16.sp),
              ),
              Text(
                totalLabel,
                style: TextStyle(color: Color(0xff7A7C90), fontSize: 16.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DayWorkoutRow extends StatelessWidget {
  final String weekday;
  final String date;
  final String tagLabel;
  final Color tagColor;
  final String workoutName;
  final String durationLabel;
  final int? index;
  final bool enableDrag;

  const DayWorkoutRow({
    super.key,
    required this.weekday,
    required this.date,
    required this.tagLabel,
    required this.tagColor,
    required this.workoutName,
    required this.durationLabel,
    this.index,
    this.enableDrag = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weekday,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 10.w,
                  height: 76.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        UIImage.svgAsset(Assets.dragIcon),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: tagColor.withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(999.r),
                                ),
                                child: Text(
                                  tagLabel,
                                  style: TextStyle(
                                    color: tagColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                workoutName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          durationLabel,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (enableDrag && index != null) {
      final feedback = Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width - 40.w,
          ),
          child: content,
        ),
      );

      content = LongPressDraggable<int>(
        data: index!,
        feedback: feedback,
        childWhenDragging: Opacity(opacity: 0.3, child: content),
        child: content,
      );
    }

    return Column(
      children: [
        content,
        Container(height: 1.h, color: Colors.white10),
      ],
    );
  }
}

class SpacerDayRow extends StatelessWidget {
  final String weekday;
  final String date;

  const SpacerDayRow({super.key, required this.weekday, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weekday,
                      style: TextStyle(
                        color: Color(0xff5D607C),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      date,
                      style: TextStyle(
                        color: Color(0xff5D607C),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 14.w),
            ],
          ),
        ),
        Container(height: 1.h, color: Colors.white10),
      ],
    );
  }
}

class WeekFooterCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String totalLabel;

  const WeekFooterCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.totalLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          top: BorderSide(color: AppColors.accentGreen, width: 2.h),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            totalLabel,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
