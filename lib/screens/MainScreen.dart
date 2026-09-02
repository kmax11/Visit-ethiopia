import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/main.dart';
import 'package:visitethiopia/screens/home.dart';
import 'package:visitethiopia/screens/calendar.dart';
import 'package:visitethiopia/screens/favorites.dart';
import 'package:visitethiopia/screens/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  final List<Widget> _pages = const [
    Home(),
    CalendarPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(icon: Icons.home_rounded, label: 'Home'),
    _NavItem(icon: Icons.calendar_month_rounded, label: 'Calendar'),
    _NavItem(icon: Icons.favorite_rounded, label: 'Favorites'),
    _NavItem(icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChange(int index) {
    setState(() => _page = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ctrl = Get.find<ThemeController>();
      final isDark = ctrl.isDark;
      final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
      final navBg = isDark ? const Color(0xFF161A27) : Colors.white;
      final textSecondary = isDark ? const Color(0xFF6B7280) : const Color(0xFF8A8FA8);

      return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (page) => setState(() => _page = page),
          children: _pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: navBg,
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.4)
                    : Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_navItems.length, (index) {
                  final item = _navItems[index];
                  final isSelected = _page == index;

                  return GestureDetector(
                    onTap: () => _onTabChange(index),
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: EdgeInsets.symmetric(
                        horizontal: isSelected ? 16 : 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? accent.withValues(alpha: 0.15) : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item.icon,
                            color: isSelected ? accent : textSecondary,
                            size: 24,
                          ),
                          if (isSelected) ...[
                            const SizedBox(width: 6),
                            Text(
                              item.label,
                              style: TextStyle(
                                color: accent,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
