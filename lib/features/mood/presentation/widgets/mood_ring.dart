import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/common/widgets/ui_image.dart';
import 'package:flutter_test_project/generated/assets.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../providers/mood_provider.dart';

class MoodRing extends StatelessWidget {
  final String moodLabel;

  const MoodRing({super.key, required this.moodLabel});

  @override
  Widget build(BuildContext context) {
    final double size = 260.w;
    final double strokeWidth = 26.w;
    final moodProvider = context.watch<MoodProvider>();
    final angle = moodProvider.knobAngle;
    final currentLabel = moodProvider.moodLabel;

    void updateFromGlobal(Offset globalPosition) {
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox == null) return;
      final local = renderBox.globalToLocal(globalPosition);
      final center = Offset(size / 2, size / 2);
      final dx = local.dx - center.dx;
      final dy = local.dy - center.dy;
      final newAngle = atan2(dy, dx);
      context.read<MoodProvider>().setAngle(newAngle);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onPanStart: (details) => updateFromGlobal(details.globalPosition),
          onPanUpdate: (details) => updateFromGlobal(details.globalPosition),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size.square(size),
                  painter: _MoodRingPainter(strokeWidth: strokeWidth),
                ),
                Container(
                  width: size * 0.48,
                  height: size * 0.48,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadowStrong,
                        blurRadius: 24,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: UIImage.asset(
                    _assetForMood(currentLabel),
                    width: size * 0.4,
                    height: size * 0.4,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                _MoodKnob(size: size, strokeWidth: strokeWidth, angle: angle),
              ],
            ),
          ),
        ),

        SizedBox(height: 24.h),
        Text(
          currentLabel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

String _assetForMood(String label) {
  switch (label) {
    case 'Content':
      return Assets.content;
    case 'Peaceful':
      return Assets.peaceful;
    case 'Happy':
      return Assets.happy;
    default:
      return Assets.calm;
  }
}

class _MoodKnob extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final double angle;

  const _MoodKnob({
    required this.size,
    required this.strokeWidth,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    final knobSize = 44.w;
    final knobRadius = (size / 2) - (knobSize / 2);
    final center = Offset(size / 2, size / 2);

    final knobCenter = Offset(
      center.dx + knobRadius * cos(angle),
      center.dy + knobRadius * sin(angle),
    );

    return Positioned(
      left: knobCenter.dx - knobSize / 2,
      top: knobCenter.dy - knobSize / 2,
      child: Container(
        width: knobSize,
        height: knobSize,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowStrong,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoodRingPainter extends CustomPainter {
  final double strokeWidth;

  _MoodRingPainter({required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final gradient = const SweepGradient(
      startAngle: -pi / 2,
      endAngle: 3 * pi / 2,
      colors: [
        AppColors.moodOrange,
        AppColors.moodPink,
        AppColors.moodPurple,
        AppColors.moodBlue,
        AppColors.moodCyan,
        AppColors.moodMint,
        AppColors.moodOrange,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final center = size.center(Offset.zero);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
