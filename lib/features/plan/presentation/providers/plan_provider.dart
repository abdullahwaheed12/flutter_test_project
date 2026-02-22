import 'package:flutter/material.dart';

class DayPlan {
  final String weekday;
  final String date;
  final String? tagLabel;
  final Color? tagColor;
  final String? workoutName;
  final String? durationLabel;

  const DayPlan({
    required this.weekday,
    required this.date,
    this.tagLabel,
    this.tagColor,
    this.workoutName,
    this.durationLabel,
  });

  bool get hasWorkout => tagLabel != null;
}

class PlanProvider extends ChangeNotifier {
  String weekTitle = 'Week 2/8';
  String weekSubtitle = 'December 8-14';
  String weekTotalLabel = 'Total: 60min';

  String footerTitle = 'Week 2';
  String footerSubtitle = 'December 14-22';
  String footerTotalLabel = 'Total: 60min';

  final List<DayPlan> days = [
    DayPlan(
      weekday: 'Mon',
      date: '8',
      tagLabel: 'Arms Workout',
      tagColor: Colors.greenAccent,
      workoutName: 'Arm Blaster',
      durationLabel: '25m - 30m',
    ),
    const DayPlan(weekday: 'Tue', date: '9'),
    const DayPlan(weekday: 'Wed', date: '10'),
    DayPlan(
      weekday: 'Thu',
      date: '11',
      tagLabel: 'Leg Workout',
      tagColor: Colors.indigoAccent,
      workoutName: 'Leg Day Blitz',
      durationLabel: '25m - 30m',
    ),
    const DayPlan(weekday: 'Fri', date: '12'),
    const DayPlan(weekday: 'Sat', date: '13'),
    const DayPlan(weekday: 'Sun', date: '14'),
  ];

  void moveWorkout(int fromIndex, int toIndex) {
    if (fromIndex == toIndex) return;
    if (fromIndex < 0 || fromIndex >= days.length) return;
    if (toIndex < 0 || toIndex >= days.length) return;

    final fromDay = days[fromIndex];
    if (!fromDay.hasWorkout) return;

    final toDay = days[toIndex];

    final clearedFromDay = DayPlan(
      weekday: fromDay.weekday,
      date: fromDay.date,
    );

    final updatedToDay = DayPlan(
      weekday: toDay.weekday,
      date: toDay.date,
      tagLabel: fromDay.tagLabel,
      tagColor: fromDay.tagColor,
      workoutName: fromDay.workoutName,
      durationLabel: fromDay.durationLabel,
    );

    days[fromIndex] = clearedFromDay;
    days[toIndex] = updatedToDay;
    notifyListeners();
  }
}
