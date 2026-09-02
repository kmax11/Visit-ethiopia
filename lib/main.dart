import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/language/LacaleString.dart';
import 'package:visitethiopia/login/signin.dart';

// ── Theme controller ──────────────────────────────────────────────────────────
class ThemeController extends GetxController {
  final _isDark = false.obs;
  bool get isDark => _isDark.value;

  void toggleTheme() {
    _isDark.value = !_isDark.value;
    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}

// ── Favorites controller ───────────────────────────────────────────────────────
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
  Get.put(ThemeController());
  Get.put(FavoritesController());
  runApp(const VisitEthiopiaApp());
}

class VisitEthiopiaApp extends StatelessWidget {
  const VisitEthiopiaApp({super.key});

  static const Color _accent = Color(0xFF4F6EF7);
  static const Color _accentDark = Color(0xFF7B96FF);
  static const Color _textPrimary = Color(0xFF1A1A2E);
  static const Color _textSecondary = Color(0xFF8A8FA8);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Visit Ethiopia',
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeMode.system,
      // ─── Light Theme ───────────────────────────────────────────────
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: _accent,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: _textPrimary, fontFamily: 'Poppins'),
          bodyMedium: TextStyle(color: _textSecondary, fontFamily: 'Poppins'),
          titleLarge: TextStyle(
              color: _textPrimary,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
          titleMedium:
              TextStyle(color: _textPrimary, fontFamily: 'Poppins'),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: _textPrimary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: _textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _accent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF0F1F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: _accent, width: 2),
          ),
          labelStyle: const TextStyle(
              color: _textSecondary, fontFamily: 'Poppins'),
          hintStyle:
              const TextStyle(color: _textSecondary, fontFamily: 'Poppins'),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: _accent,
          textColor: _textPrimary,
        ),
        dividerTheme:
            const DividerThemeData(color: Color(0xFFEEEFF3)),
        iconTheme: const IconThemeData(color: _accent),
      ),
      // ─── Dark Theme ────────────────────────────────────────────────
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: _accentDark,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          bodyLarge:
              TextStyle(color: Color(0xFFE8EAF6), fontFamily: 'Poppins'),
          bodyMedium:
              TextStyle(color: Color(0xFFB0B3C6), fontFamily: 'Poppins'),
          titleLarge: TextStyle(
              color: Color(0xFFE8EAF6),
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
          titleMedium:
              TextStyle(color: Color(0xFFE8EAF6), fontFamily: 'Poppins'),
        ),
        scaffoldBackgroundColor: const Color(0xFF0F1117),
        cardColor: const Color(0xFF1C1F2E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161A27),
          foregroundColor: Color(0xFFE8EAF6),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFFE8EAF6),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _accentDark,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF252840),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: _accentDark, width: 2),
          ),
          labelStyle: const TextStyle(
              color: Color(0xFFB0B3C6), fontFamily: 'Poppins'),
          hintStyle: const TextStyle(
              color: Color(0xFFB0B3C6), fontFamily: 'Poppins'),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF161A27),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: _accentDark,
          textColor: Color(0xFFE8EAF6),
        ),
        dividerTheme:
            const DividerThemeData(color: Color(0xFF2A2D40)),
        iconTheme: const IconThemeData(color: _accentDark),
      ),
      home: const Login(),
    );
  }
}
