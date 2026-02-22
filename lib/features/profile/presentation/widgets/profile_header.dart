import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          email,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
