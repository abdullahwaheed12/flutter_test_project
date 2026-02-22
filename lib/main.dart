import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_colors.dart';
import 'features/bottom_nav/presentations/screens/bottom_nav.dart';
import 'features/nutrition/presentation/screens/nutrition_screen.dart';
import 'features/plan/presentation/screens/plan_screen.dart';
import 'features/mood/presentation/screens/mood_screen.dart';
import 'features/profile/presentation/screens/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final baseTheme = ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.dark,
          useMaterial3: false,
        );

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: baseTheme.copyWith(
            textTheme: GoogleFonts.mulishTextTheme(baseTheme.textTheme),
          ),
          home: const RootScreen(),
        );
      },
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedTabIndex,
          children: const [
            NutritionScreen(),
            PlanScreen(),
            MoodScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedTabIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
      ),
    );
  }
}
