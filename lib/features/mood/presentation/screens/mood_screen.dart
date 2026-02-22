import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../providers/mood_provider.dart';
import '../widgets/mood_ring.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MoodProvider(),
      child: const _MoodView(),
    );
  }
}

class _MoodView extends StatelessWidget {
  const _MoodView();

  @override
  Widget build(BuildContext context) {
    final moodProvider = context.watch<MoodProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Text(
            'Mood',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Start your day',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'How are you feeling at the\nMoment?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          SizedBox(height: 40.h),
          Center(child: MoodRing(moodLabel: moodProvider.moodLabel)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowStrong,
                    blurRadius: 18,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
