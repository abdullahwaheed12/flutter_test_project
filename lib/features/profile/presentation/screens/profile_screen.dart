import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../providers/profile_provider.dart';
import '../widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          ProfileHeader(name: profile.userName, email: profile.email),
          SizedBox(height: 24.h),
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'Profile screen placeholder',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
