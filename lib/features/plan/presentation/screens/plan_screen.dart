import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/plan_provider.dart';
import '../widgets/plan_widgets.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanProvider(),
      child: const _PlanView(),
    );
  }
}

class _PlanView extends StatelessWidget {
  const _PlanView();

  @override
  Widget build(BuildContext context) {
    final plan = context.watch<PlanProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Training Calendar',
                style: TextStyle(
                  color: Color(0xffEBEBEB),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Save',
                style: TextStyle(
                  color: Color(0xffEBEBEB),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Container(height: 3.h, color: Color(0xff4855DF)),
        WeekHeaderCard(
          title: plan.weekTitle,
          subtitle: plan.weekSubtitle,
          totalLabel: plan.weekTotalLabel,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var index = 0; index < plan.days.length; index++)
                          _PlanDayRow(index: index, day: plan.days[index]),
                        SizedBox(height: 28.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(height: 3.h, color: Color(0xff18AA99)),

        WeekHeaderCard(
          title: plan.footerTitle,
          subtitle: plan.footerSubtitle,
          totalLabel: plan.footerTotalLabel,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}

class _PlanDayRow extends StatelessWidget {
  final int index;
  final DayPlan day;

  const _PlanDayRow({required this.index, required this.day});

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onWillAcceptWithDetails: (details) {
        final fromIndex = details.data;
        return fromIndex != index;
      },
      onAcceptWithDetails: (details) {
        final fromIndex = details.data;
        context.read<PlanProvider>().moveWorkout(fromIndex, index);
      },
      builder: (context, candidateData, rejectedData) {
        if (day.hasWorkout) {
          return DayWorkoutRow(
            weekday: day.weekday,
            date: day.date,
            tagLabel: day.tagLabel!,
            tagColor: day.tagColor!,
            workoutName: day.workoutName!,
            durationLabel: day.durationLabel!,
            index: index,
            enableDrag: true,
          );
        }

        return SpacerDayRow(weekday: day.weekday, date: day.date);
      },
    );
  }
}
