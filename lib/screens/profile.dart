import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/login/signin.dart';
import 'package:visitethiopia/main.dart';
import 'package:visitethiopia/screens/about.dart';
import 'package:visitethiopia/screens/calendar.dart';
import 'package:visitethiopia/screens/calender_converter.dart';
import '../currency/currency.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _showLanguageDialog(BuildContext context, Color accent) {
    final locale = [
      {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
      {'name': 'አማርኛ', 'locale': const Locale('am', 'ET')},
    ];

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Choose Language',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: locale.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Get.back();
                    Get.updateLocale(locale[index]['locale'] as Locale);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.translate_rounded, color: accent, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          locale[index]['name'] as String,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeCtrl = Get.find<ThemeController>();
      final favCtrl = Get.find<FavoritesController>();
      final isDark = themeCtrl.isDark;
      final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
      final bg = isDark ? const Color(0xFF0F1117) : const Color(0xFFF7F8FC);
      final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;
      final textPrimary =
          isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
      final textSecondary =
          isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);
      final dividerColor =
          isDark ? const Color(0xFF2A2D40) : const Color(0xFFEEEFF3);

      return Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: cardBg,
          elevation: 0,
          title: Text(
            'profile'.tr,
            style: TextStyle(
              color: textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: accent,
              ),
              onPressed: () => themeCtrl.toggleTheme(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // ── Header Profile Card ──────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [accent, accent.withValues(alpha: 0.6)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: cardBg, width: 2),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Visit Ethiopia Explorer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'visit@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: textSecondary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: accent.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.workspace_premium_rounded,
                              size: 16, color: accent),
                          const SizedBox(width: 6),
                          Text(
                            'Gold Traveler',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: accent,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── Stats Row ──────────────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      icon: Icons.favorite_rounded,
                      title: 'Favorites',
                      value: '${favCtrl.favorites.length}',
                      accent: accent,
                      cardBg: cardBg,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _statCard(
                      icon: Icons.explore_rounded,
                      title: 'Trips Taken',
                      value: '12',
                      accent: accent,
                      cardBg: cardBg,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _statCard(
                      icon: Icons.star_rounded,
                      title: 'Reviews',
                      value: '5',
                      accent: accent,
                      cardBg: cardBg,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      isDark: isDark,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ── Options List ────────────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _profileOption(
                      icon: Icons.calendar_month_rounded,
                      title: 'calendar'.tr,
                      subtitle: 'View Ethiopian Calendar events',
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CalendarPage())),
                    ),
                    Divider(
                        height: 1,
                        color: dividerColor,
                        indent: 60,
                        endIndent: 20),
                    _profileOption(
                      icon: Icons.edit_calendar_rounded,
                      title: 'calendarconverter'.tr,
                      subtitle: 'Convert between Gregorian & Geez calendar',
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CalendarConverter())),
                    ),
                    Divider(
                        height: 1,
                        color: dividerColor,
                        indent: 60,
                        endIndent: 20),
                    _profileOption(
                      icon: Icons.currency_exchange_rounded,
                      title: 'currency'.tr,
                      subtitle: 'Ethiopian Birr exchange rates',
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MyCurrency())),
                    ),
                    Divider(
                        height: 1,
                        color: dividerColor,
                        indent: 60,
                        endIndent: 20),
                    _profileOption(
                      icon: Icons.language_rounded,
                      title: 'language'.tr,
                      subtitle: 'Change app language (English / አማርኛ)',
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () => _showLanguageDialog(context, accent),
                    ),
                    Divider(
                        height: 1,
                        color: dividerColor,
                        indent: 60,
                        endIndent: 20),
                    _profileOption(
                      icon: Icons.info_outline_rounded,
                      title: 'about'.tr,
                      subtitle: 'App version and group members',
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const About())),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Log Out Button ──────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const Login()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout_rounded,
                      color: Colors.redAccent, size: 20),
                  label: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent, width: 1.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    });
  }

  Widget _statCard({
    required IconData icon,
    required String title,
    required String value,
    required Color accent,
    required Color cardBg,
    required Color textPrimary,
    required Color textSecondary,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: accent, size: 22),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: textSecondary,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _profileOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color accent,
    required Color textPrimary,
    required Color textSecondary,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: accent, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: 'Poppins',
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: textSecondary,
          fontSize: 11,
          fontFamily: 'Poppins',
        ),
      ),
      trailing:
          Icon(Icons.arrow_forward_ios_rounded, size: 14, color: textSecondary),
      onTap: onTap,
    );
  }
}
