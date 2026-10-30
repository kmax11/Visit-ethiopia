
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 1.  RAW PALETTE  (private — use AppColors in widgets)
// ═══════════════════════════════════════════════════════════════════════════

abstract class _P {
  // Accent
  static const accentL = Color(0xFF4F6EF7);
  static const accentD = Color(0xFF7B96FF);

  // Backgrounds
  static const bgL = Color(0xFFF7F8FC);
  static const bgD = Color(0xFF0F1117);

  // Surfaces / Cards
  static const surfaceL = Colors.white;
  static const surfaceD = Color(0xFF1C1F2E);

  // AppBar
  static const appBarL = Colors.white;
  static const appBarD = Color(0xFF161A27);

  // Text
  static const textPriL = Color(0xFF1A1A2E);
  static const textPriD = Color(0xFFE8EAF6);
  static const textSecL = Color(0xFF8A8FA8);
  static const textSecD = Color(0xFFB0B3C6);

  // Input fill
  static const inputFillL = Color(0xFFF0F1F5);
  static const inputFillD = Color(0xFF252840);

  // Chip / secondary surface
  static const chipL = Colors.white;
  static const chipD = Color(0xFF252840);

  // Divider
  static const dividerL = Color(0xFFEEEFF3);
  static const dividerD = Color(0xFF2A2D40);

  // Drawer
  static const drawerL = Colors.white;
  static const drawerD = Color(0xFF161A27);

  // Bottom nav
  static const navBgL = Colors.white;
  static const navBgD = Color(0xFF161A27);

  // Shared
  static const font = 'Poppins';
  static const badge = Colors.red;
  static const logout = Colors.redAccent;
}

// ═══════════════════════════════════════════════════════════════════════════
// 2.  APP COLORS  — resolved token set for the current brightness
// ═══════════════════════════════════════════════════════════════════════════

/// Resolved color set. Always obtain via [AppColors.of(context)].
///
/// Example:
/// ```dart
/// final c = AppColors.of(context);
/// Container(color: c.surface, child: Text('Hi', style: TextStyle(color: c.textPrimary)));
/// ```
class AppColors {
  const AppColors._(this.isDark);

  final bool isDark;

  /// Resolve colors from the nearest [Theme] in the widget tree.
  factory AppColors.of(BuildContext context) =>
      AppColors._(Theme.of(context).brightness == Brightness.dark);

  // ── Semantic tokens ────────────────────────────────────────────────────
  Color get accent      => isDark ? _P.accentD      : _P.accentL;
  Color get bg          => isDark ? _P.bgD          : _P.bgL;
  Color get surface     => isDark ? _P.surfaceD     : _P.surfaceL;
  Color get cardBg      => surface; // alias
  Color get appBar      => isDark ? _P.appBarD      : _P.appBarL;
  Color get navBg       => isDark ? _P.navBgD       : _P.navBgL;
  Color get textPrimary => isDark ? _P.textPriD     : _P.textPriL;
  Color get textSecondary => isDark ? _P.textSecD   : _P.textSecL;
  Color get inputFill   => isDark ? _P.inputFillD   : _P.inputFillL;
  Color get chipBg      => isDark ? _P.chipD        : _P.chipL;
  Color get divider     => isDark ? _P.dividerD     : _P.dividerL;
  Color get drawer      => isDark ? _P.drawerD      : _P.drawerL;

  // Hero gradient helpers
  Color get heroGradientStart =>
      isDark ? _P.chipD : accent.withValues(alpha: 0.08);
  Color get heroGradientEnd =>
      isDark ? _P.surfaceD : accent.withValues(alpha: 0.02);
  Color get heroBorder =>
      isDark ? _P.dividerD : accent.withValues(alpha: 0.15);

  // Border used in Details bottom bar outline button
  Color get outlineBorder =>
      isDark ? _P.dividerD : const Color(0xFFE0E2EC);

  // Non-brightness-dependent constants
  static const Color badge  = _P.badge;
  static const Color logout = _P.logout;
  static const String font  = _P.font;
}

// ═══════════════════════════════════════════════════════════════════════════
// 3.  APP THEME — light & dark ThemeData definitions
// ═══════════════════════════════════════════════════════════════════════════

abstract class AppTheme {
  // ── Light ─────────────────────────────────────────────────────────────
  static ThemeData get light => _build(false);

  // ── Dark ──────────────────────────────────────────────────────────────
  static ThemeData get dark => _build(true);

  static ThemeData _build(bool dark) {
    final accent = dark ? _P.accentD : _P.accentL;
    final textPri = dark ? _P.textPriD : _P.textPriL;
    final textSec = dark ? _P.textSecD : _P.textSecL;
    final brightness = dark ? Brightness.dark : Brightness.light;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: _P.font,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: brightness,
      ),
      scaffoldBackgroundColor: dark ? _P.bgD : _P.bgL,
      cardColor: dark ? _P.surfaceD : _P.surfaceL,

      // ── Text ────────────────────────────────────────────────────────────
      textTheme: TextTheme(
        bodyLarge:   TextStyle(color: textPri, fontFamily: _P.font),
        bodyMedium:  TextStyle(color: textSec, fontFamily: _P.font),
        titleLarge:  TextStyle(color: textPri, fontWeight: FontWeight.bold, fontFamily: _P.font),
        titleMedium: TextStyle(color: textPri, fontFamily: _P.font),
      ),

      // ── AppBar ──────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: dark ? _P.appBarD : _P.appBarL,
        foregroundColor: textPri,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPri,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: _P.font,
        ),
      ),

      // ── ElevatedButton ──────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: _P.font,
          ),
        ),
      ),

      // ── Input ───────────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: dark ? _P.inputFillD : _P.inputFillL,
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
          borderSide: BorderSide(color: accent, width: 2),
        ),
        labelStyle: TextStyle(color: textSec, fontFamily: _P.font),
        hintStyle:  TextStyle(color: textSec, fontFamily: _P.font),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),

      // ── Drawer ──────────────────────────────────────────────────────────
      drawerTheme: DrawerThemeData(backgroundColor: dark ? _P.drawerD : _P.drawerL),

      // ── ListTile ────────────────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        iconColor: accent,
        textColor: textPri,
      ),

      // ── Divider ─────────────────────────────────────────────────────────
      dividerTheme: DividerThemeData(color: dark ? _P.dividerD : _P.dividerL),

      // ── Icon ────────────────────────────────────────────────────────────
      iconTheme: IconThemeData(color: accent),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 4.  APP THEME CONTROLLER  (GetX reactive)
// ═══════════════════════════════════════════════════════════════════════════

/// Reactive GetX controller that drives light ↔ dark switching globally.
///
/// **Register once in `main()`:**
/// ```dart
/// Get.put(AppThemeController());
/// ```
///
/// **Toggle from any widget:**
/// ```dart
/// IconButton(
///   icon: Obx(() {
///     final ctrl = Get.find<AppThemeController>();
///     return Icon(ctrl.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded);
///   }),
///   onPressed: () => Get.find<AppThemeController>().toggleTheme(),
/// )
/// ```
class AppThemeController extends GetxController {
  final _isDark = false.obs;

  /// `true` when dark mode is active.
  bool get isDark => _isDark.value;

  /// Toggle between light and dark.
  void toggleTheme() {
    _isDark.value = !_isDark.value;
    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  /// Force a specific [ThemeMode].
  void setTheme(ThemeMode mode) {
    _isDark.value = mode == ThemeMode.dark;
    Get.changeThemeMode(mode);
  }
}
