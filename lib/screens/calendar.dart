import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../calendar/models/calendar/EthiopianCalendar.dart';
import '../theme/app_theme.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  EthiopianCalendar _calendar = EthiopianCalendar.now();
  final EthiopianCalendar _today = EthiopianCalendar.now();

  final List<String> _weekdayNames = [
    'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
  ];

  final List<String> _gregMonths = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    _fadeAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOut);
    _animController.value = 1.0;
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _changeMonth(int dir) async {
    _animController.reverse();
    await Future.delayed(const Duration(milliseconds: 180));
    setState(() {
      _calendar = dir > 0 ? _calendar.nextMonth() : _calendar.previousMonth();
    });
    _animController.forward();
  }

  String _gregorianSubtitle() {
    try {
      final gc = _calendar.toGC();
      return '${_gregMonths[(gc.month! - 1).clamp(0, 11)]} ${gc.year}';
    } catch (_) {
      return '';
    }
  }

  bool _isToday(int day) =>
      _calendar.year == _today.year &&
      _calendar.month == _today.month &&
      day == _today.day;

  int _getGregorianDay(int ethDay) {
    try {
      final eth = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: ethDay);
      return eth.toGC().day ?? ethDay;
    } catch (_) {
      return ethDay;
    }
  }

  List<Widget> _buildCalendarCells(AppColors c) {
    List<Widget> cells = [];
    int daysInMonth = _calendar.daysInMonth();
    int firstDayOfWeek = _calendar.firstDayOfWeek();
    int prevMonthOffset = (firstDayOfWeek + 5) % 7;

    // Weekday headers
    for (int i = 0; i < 7; i++) {
      final isWeekend = i == 0 || i == 6;
      cells.add(Center(
        child: Text(
          _weekdayNames[i],
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            fontFamily: AppColors.font,
            color: isWeekend
                ? c.accent.withValues(alpha: 0.7)
                : c.textSecondary,
          ),
        ),
      ));
    }

    // Previous month fillers
    int prevMonthDays = _calendar.previousMonth().daysInMonth();
    for (int i = prevMonthDays - prevMonthOffset + 1;
        i <= prevMonthDays;
        i++) {
      cells.add(_DayCell(
        ethDay: i,
        gregDay: null,
        isToday: false,
        isCurrentMonth: false,
        colors: c,
      ));
    }

    // Current month days
    for (int i = 1; i <= daysInMonth; i++) {
      cells.add(_DayCell(
        ethDay: i,
        gregDay: _getGregorianDay(i),
        isToday: _isToday(i),
        isCurrentMonth: true,
        colors: c,
      ));
    }

    // Next month fillers
    int filled = prevMonthOffset + daysInMonth;
    int totalCells = ((filled / 7).ceil()) * 7;
    for (int i = 1; i <= totalCells - filled; i++) {
      cells.add(_DayCell(
        ethDay: i,
        gregDay: null,
        isToday: false,
        isCurrentMonth: false,
        colors: c,
      ));
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Re-resolve colors whenever theme changes
      Get.find<AppThemeController>().isDark; // reactive read
      final c = AppColors.of(context);

      return Scaffold(
        backgroundColor: c.bg,
        appBar: AppBar(
          backgroundColor: c.appBar,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: c.divider),
              ),
              child: Icon(Icons.arrow_back_ios_rounded,
                  size: 16, color: c.textPrimary),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'calendar'.tr,
            style: TextStyle(
              color: c.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: AppColors.font,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 8),

            // ── Month navigation ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _NavButton(
                    icon: Icons.chevron_left_rounded,
                    colors: c,
                    onTap: () => _changeMonth(-1),
                  ),
                  FadeTransition(
                    opacity: _fadeAnim,
                    child: Column(
                      children: [
                        Text(
                          '${_calendar.month_name ?? ''} ${_calendar.year ?? ''}',
                          style: TextStyle(
                            color: c.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            fontFamily: AppColors.font,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _gregorianSubtitle(),
                          style: TextStyle(
                            color: c.textSecondary,
                            fontSize: 13,
                            fontFamily: AppColors.font,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _NavButton(
                    icon: Icons.chevron_right_rounded,
                    colors: c,
                    onTap: () => _changeMonth(1),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: c.divider, height: 1),
            ),
            const SizedBox(height: 12),

            // ── Calendar grid ─────────────────────────────────────────
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnim,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 7,
                    childAspectRatio: 0.9,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: _buildCalendarCells(c),
                  ),
                ),
              ),
            ),

            // ── Today chip ────────────────────────────────────────────
            Container(
              margin: const EdgeInsets.only(bottom: 24, top: 8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: c.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: c.accent.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.today_rounded, color: c.accent, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    '${'today'.tr}: ${_today.month_name ?? ''} ${_today.day}, ${_today.year}',
                    style: TextStyle(
                      color: c.accent,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      fontFamily: AppColors.font,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: c.accent,
          foregroundColor: Colors.white,
          elevation: 4,
          onPressed: () {},
          child: const Icon(Icons.add_rounded, size: 28),
        ),
      );
    });
  }
}

// ─── Nav arrow button ─────────────────────────────────────────────────────────
class _NavButton extends StatelessWidget {
  final IconData icon;
  final AppColors colors;
  final VoidCallback onTap;

  const _NavButton({
    required this.icon,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.divider),
        ),
        child: Icon(icon, color: colors.textPrimary, size: 26),
      ),
    );
  }
}

// ─── Day cell ─────────────────────────────────────────────────────────────────
class _DayCell extends StatelessWidget {
  final int ethDay;
  final int? gregDay;
  final bool isToday;
  final bool isCurrentMonth;
  final AppColors colors;

  const _DayCell({
    required this.ethDay,
    required this.gregDay,
    required this.isToday,
    required this.isCurrentMonth,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final Color dayColor;
    if (isToday) {
      dayColor = Colors.white;
    } else if (!isCurrentMonth) {
      dayColor = colors.textSecondary.withValues(alpha: 0.35);
    } else {
      dayColor = colors.textPrimary;
    }

    return Center(
      child: Container(
        width: 40,
        height: 44,
        decoration: isToday
            ? BoxDecoration(
                color: colors.accent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: colors.accent.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$ethDay',
              style: TextStyle(
                fontSize: 15,
                fontFamily: AppColors.font,
                fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
                color: dayColor,
              ),
            ),
            if (gregDay != null && isCurrentMonth)
              Text(
                '$gregDay',
                style: TextStyle(
                  fontSize: 9,
                  color: isToday
                      ? Colors.white.withValues(alpha: 0.75)
                      : colors.textSecondary.withValues(alpha: 0.65),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
