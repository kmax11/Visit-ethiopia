import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/language/LacaleString.dart';
import 'package:visitethiopia/login/signin.dart';
import 'package:visitethiopia/theme/app_theme.dart';

// ── Favorites controller ───────────────────────────────────────────────────
class FavoritesController extends GetxController {
  final RxList<int> favorites = <int>[].obs;

  bool isFavorite(int index) => favorites.contains(index);

  void toggleFavorite(int index) {
    if (favorites.contains(index)) {
      favorites.remove(index);
    } else {
      favorites.add(index);
    }
  }
}

void main() {
  // Register controllers before runApp so they are available app-wide.
  Get.put(AppThemeController());
  Get.put(FavoritesController());
  runApp(const VisitEthiopiaApp());
}

class VisitEthiopiaApp extends StatelessWidget {
  const VisitEthiopiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Visit Ethiopia',
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // Always start in light mode to match AppThemeController's initial state
      // (isDark = false). The toggle button overrides this at runtime.
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const Login(),
    );
  }
}
