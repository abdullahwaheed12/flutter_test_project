## Dependencies Used & Why

- flutter_screenutil: For responsive sizing (width/height/font) across different screen sizes.
- flutter_svg: To display SVG icons and illustrations.
- provider: For state management
- google_fonts: To apply Google Fonts.


## Project Structure

```text
lib/
  main.dart                 # App entry point, sets up theme, navigation, providers

  core/
    utils/
      app_colors.dart       # Centralized color palette used across the app

  common/
    widgets/
      ui_image.dart         # Shared image widget with common configuration

  generated/
    assets.dart             # Generated assets file  

  features/
    bottom_nav/
      presentations/
        providers/
          bottom_nav_provider.dart   # Manages current bottom navigation index
        screens/
          bottom_nav.dart            # Root scaffold with bottom navigation bar
        widgets/
          bottom_nav_bar_widget.dart # Custom bottom navigation bar UI

    mood/
      presentation/
        providers/
          mood_provider.dart         # Mood state (label, knob angle, etc.)
        screens/
          mood_screen.dart           # Mood screen UI
        widgets/
          mood_ring.dart             # Custom mood ring, knob, and mood image widget

    nutrition/
      presentation/
        providers/
          nutrition_provider.dart    # Nutrition/hydration related state
        screens/
          nutrition_screen.dart      # Nutrition overview screen
        widgets/
          nutrition_widgets.dart     # Nutrition cards (hydration, etc.)

    plan/
      presentation/
        providers/
          plan_provider.dart         # Plan data and drag-and-drop logic
        screens/
          plan_screen.dart           # Workout plan overview screen
        widgets/
          plan_widgets.dart          # Plan cards, headers, and day rows

    profile/
      presentation/
        providers/
          profile_provider.dart      # Profile-related state
        screens/
          profile_screen.dart        # Profile screen UI
        widgets/
          profile_header.dart        # Profile header widget
```

## App Screenshots

Screenshots are located in the [`screenshots/`](screenshots/) folder.

![Mood Screen](screenshots/mood.png)
![Plan Screen](screenshots/plan.png)
![Nutrition Screen](screenshots/nutrition.png)
![Profile Screen](screenshots/profile.png)

---

## App Video

You can watch a short demo of the app here:

[App Demo Video](https://drive.google.com/file/d/1EgZnIk1N9N3xYMKoTat06qu3iTmr4GEP/view?usp=sharing)
<!-- Or use a GitHub-hosted video if preferred -->

---

## App APK

Download the release APK for Android:

[Download app-release.apk](https://github.com/abdullahwaheed12/flutter_test_project/releases/download/v1.0.0/app-release.apk)

---

## How to Run

Requires Flutter SDK `^3.9.2` 
