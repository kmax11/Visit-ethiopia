// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/login/signin.dart';
import 'package:visitethiopia/main.dart';
import 'package:visitethiopia/screens/about.dart';
import 'package:visitethiopia/screens/calendar.dart';
import 'package:visitethiopia/screens/calender_converter.dart';
import '../currency/currency.dart';
import '../util/Constant.dart';
import '../util/places.dart';
import '../widgets/VerticalPlaceItem.dart';
import '../widgets/horizontalPlaceItem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? category;

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'አማርኛ', 'locale': Locale('am', 'ET')},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final surface = isDark ? const Color(0xFF1C1F2E) : Colors.white;
    final bgColor = isDark ? const Color(0xFF0F1117) : const Color(0xFFF7F8FC);
    final textPrimary =
        isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
    final textSecondary =
        isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);

    return Scaffold(
      backgroundColor: bgColor,
      drawer: _buildDrawer(
        context,
        isDark: isDark,
        accent: accent,
        surface: surface,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
      ),
      appBar: AppBar(
        backgroundColor: surface,
        elevation: 0,
        iconTheme: IconThemeData(color: accent),
        title: Text(
          'tit'.tr,
          style: TextStyle(
            color: textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        actions: [
          // Language toggle
          IconButton(
            icon: Icon(Icons.language_rounded, color: accent),
            tooltip: 'language'.tr,
            onPressed: () => _buildLanguageDialog(context, accent),
          ),
          // Dark mode toggle
          Obx(() {
            final ctrl = Get.find<ThemeController>();
            return IconButton(
              icon: Icon(
                ctrl.isDark
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
                color: accent,
              ),
              tooltip: ctrl.isDark ? 'Light Mode' : 'Dark Mode',
              onPressed: () => ctrl.toggleTheme(),
            );
          }),
          const SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ── Hero greeting ────────────────────────────────────────
          _buildHeroHeader(
              isDark: isDark,
              accent: accent,
              textPrimary: textPrimary,
              textSecondary: textSecondary),

          // ── Popular places horizontal scroll ─────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'popular'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 13,
                    color: accent,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          _buildHorizontalList(context),

          const SizedBox(height: 20),

          // ── Category filter chips ────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              'Explore by category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: textPrimary,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildCategoryChips(isDark: isDark, accent: accent),

          const SizedBox(height: 16),

          // ── Vertical place list ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: category == null
                ? buildVerticalList("All")
                : buildVerticalList(category!),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeroHeader({
    required bool isDark,
    required Color accent,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF252840), const Color(0xFF1C1F2E)]
              : [accent.withValues(alpha: 0.08), accent.withValues(alpha: 0.02)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? const Color(0xFF2A2D40)
              : accent.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.place_rounded, color: accent, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      'Ethiopia 🇪🇹',
                      style: TextStyle(
                        color: accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'hometitle'.tr,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: textPrimary,
              fontFamily: 'Poppins',
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Discover breathtaking landscapes, ancient history & vibrant culture.',
            style: TextStyle(
              fontSize: 13,
              color: textSecondary,
              fontFamily: 'Poppins',
            ),
          ),
               ],
      ),
    );
  }

  Widget _buildCategoryChips({
    required bool isDark,
    required Color accent,
  }) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: Constants.category.length,
        itemBuilder: (context, index) {
          final isSelected = (category == null && index == 0) ||
              (category == Constants.category[index]);
          return GestureDetector(
            onTap: () {
              setState(() {
                category = Constants.category[index] == 'All'
                    ? null
                    : Constants.category[index];
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 10),
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? accent
                    : isDark
                        ? const Color(0xFF252840)
                        : Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: accent.withValues(alpha: 0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ],
              ),
              child: Text(
                Constants.category[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : isDark
                          ? const Color(0xFFB0B3C6)
                          : const Color(0xFF6B7280),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHorizontalList(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: 4,
        itemBuilder: (context, index) {
          final place = places.toList()[index];
          return HorizontalPlaceItem(place: place, index: index);
        },
      ),
    );
  }

  Widget buildVerticalList(String category) {
    final selectedItems = <int>[];
    if (category == 'All') {
      for (int i = 0; i < places.length; i++) {
        selectedItems.add(i);
      }
    } else {
      for (int i = 0; i < places.length; i++) {
        if (places[i]['category'] == category) {
          selectedItems.add(i);
        }
      }
    }

    return ListView.builder(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: selectedItems.length,
      itemBuilder: (context, index) {
        final place = places[selectedItems[index]];
        return VerticalPlaceItem(
            place: place, index: selectedItems[index]);
      },
    );
  }

  // ── Drawer ──────────────────────────────────────────────────────────
  Widget _buildDrawer(
    BuildContext context, {
    required bool isDark,
    required Color accent,
    required Color surface,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Drawer(
      width: 260,
      backgroundColor: surface,
      child: SafeArea(
        child: Column(
          children: [
            // Header image
            Container(
              height: 160,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/aa/aa2.jpeg', fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 16,
                    child: Text(
                      'Visit Ethiopia',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _drawerTile(
              context,
              icon: Icons.person_rounded,
              title: 'login'.tr,
              accent: accent,
              textPrimary: textPrimary,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Login()));
              },
            ),
            _drawerTile(
              context,
              icon: Icons.calendar_month_rounded,
              title: 'calendar'.tr,
              accent: accent,
              textPrimary: textPrimary,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CalendarPage()));
              },
            ),
            _drawerTile(
              context,
              icon: Icons.edit_calendar_rounded,
              title: 'calendarconverter'.tr,
              accent: accent,
              textPrimary: textPrimary,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CalendarConverter()));
              },
            ),
            _drawerTile(
              context,
              icon: Icons.currency_exchange_rounded,
              title: 'currency'.tr,
              accent: accent,
              textPrimary: textPrimary,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MyCurrency()));
              },
            ),
            _drawerTile(
              context,
              icon: Icons.language_rounded,
              title: 'language'.tr,
              accent: accent,
              textPrimary: textPrimary,
              onTap: () {
                Navigator.pop(context);
                _buildLanguageDialog(context, accent);
              },
            ),
            _drawerTile(
              context,
              icon: Icons.info_outline_rounded,
              title: 'about'.tr,
              accent: accent,
              textPrimary: textPrimary,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => About()));
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Obx(() {
                final ctrl = Get.find<ThemeController>();
                return GestureDetector(
                  onTap: () => ctrl.toggleTheme(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          ctrl.isDark
                              ? Icons.light_mode_rounded
                              : Icons.dark_mode_rounded,
                          color: accent,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          ctrl.isDark ? 'Light Mode' : 'Dark Mode',
                          style: TextStyle(
                            color: accent,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color accent,
    required Color textPrimary,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: accent, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textPrimary,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      onTap: onTap,
    );
  }

  // ── Language dialog ─────────────────────────────────────────────────
  void _buildLanguageDialog(BuildContext context, Color accent) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
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
                    Get.updateLocale(locale[index]['locale']);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.translate_rounded,
                            color: accent, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          locale[index]['name'],
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
}
