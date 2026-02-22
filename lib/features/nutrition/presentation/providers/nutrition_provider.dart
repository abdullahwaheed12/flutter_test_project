import 'package:flutter/material.dart';

class WorkoutInfo {
  final String dateLabel;
  final String title;
  final String durationLabel;

  const WorkoutInfo({
    required this.dateLabel,
    required this.title,
    required this.durationLabel,
  });
}

class NutritionProvider extends ChangeNotifier {
  int selectedDayIndex = 1;
  late DateTime startOfWeek;
  late DateTime selectedDate;

  final List<WorkoutInfo> workouts = [
    const WorkoutInfo(
      dateLabel: 'December 21 - 20m - 25m',
      title: 'Cardio',
      durationLabel: '20m - 25m',
    ),
    const WorkoutInfo(
      dateLabel: 'December 22 - 25m - 30m',
      title: 'Upper Body',
      durationLabel: '25m - 30m',
    ),
    const WorkoutInfo(
      dateLabel: 'December 23 - 30m - 40m',
      title: 'Lower Body',
      durationLabel: '30m - 40m',
    ),
    const WorkoutInfo(
      dateLabel: 'December 24 - 30m - 45m',
      title: 'Full Body',
      durationLabel: '30m - 45m',
    ),
    const WorkoutInfo(
      dateLabel: 'December 25 - 20m - 30m',
      title: 'Stretching',
      durationLabel: '20m - 30m',
    ),
    const WorkoutInfo(
      dateLabel: 'December 26 - 25m - 30m',
      title: 'Core',
      durationLabel: '25m - 30m',
    ),
    const WorkoutInfo(
      dateLabel: 'December 27 - 30m - 35m',
      title: 'Upper Body',
      durationLabel: '30m - 35m',
    ),
  ];

  NutritionProvider() {
    final now = DateTime.now();
    startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final todayIndex = now.difference(startOfWeek).inDays.clamp(0, 6);
    selectedDayIndex = todayIndex;
    selectedDate = startOfWeek.add(Duration(days: selectedDayIndex));
  }

  WorkoutInfo get selectedWorkout => workouts[selectedDayIndex];

  int get weekOfMonth {
    final date = selectedDate;
    final firstOfMonth = DateTime(date.year, date.month, 1);
    final firstWeekdayIndex = (firstOfMonth.weekday + 6) % 7;
    final dayIndex = date.day - 1;
    return (firstWeekdayIndex + dayIndex) ~/ 7 + 1;
  }

  int get totalWeeksInMonth {
    final date = selectedDate;
    final firstOfMonth = DateTime(date.year, date.month, 1);
    final daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    final firstWeekdayIndex = (firstOfMonth.weekday + 6) % 7;
    return (firstWeekdayIndex + daysInMonth - 1) ~/ 7 + 1;
  }

  String formatFullDate(DateTime date) {
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
    final day = date.day.toString().padLeft(2, '0');
    final month = months[date.month - 1];
    return '$day $month ${date.year}';
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    final index = date.difference(startOfWeek).inDays;
    if (index >= 0 && index < workouts.length) {
      selectedDayIndex = index;
    }
    notifyListeners();
  }

  void selectDateFromMonth(DateTime date) {
    selectedDate = date;
    startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    final index = selectedDate.difference(startOfWeek).inDays;
    if (index >= 0 && index < workouts.length) {
      selectedDayIndex = index;
    }
    notifyListeners();
  }
}
