import 'package:flutter/material.dart';
import '../calendar/models/calendar/EthiopianCalendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  static const Color _accent = Color(0xFF4F6EF7);
  static const Color _textPrimary = Color(0xFF1A1A2E);
  static const Color _textSecondary = Color(0xFF8A8FA8);

  EthiopianCalendar _calendar = EthiopianCalendar.now();
  final EthiopianCalendar _today = EthiopianCalendar.now();

  final List<String> _weekdayNames = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  // Gregorian month names for subtitle
  final List<String> _gregMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  int _slideDir = 0; // -1 left, 1 right, 0 init

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
      if (dir > 0) {
        _calendar = _calendar.nextMonth();
      } else {
        _calendar = _calendar.previousMonth();
      }
      _slideDir = dir;
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

  bool _isToday(int day) {
    return _calendar.year == _today.year &&
        _calendar.month == _today.month &&
        day == _today.day;
  }

  int _getGregorianDay(int ethDay) {
    try {
      final eth = EthiopianCalendar(
        year: _calendar.year,
        month: _calendar.month,
        day: ethDay,
      );
      final gc = eth.toGC();
      return gc.day ?? ethDay;
    } catch (_) {
      return ethDay;
    }
  }

  List<Widget> _buildCalendarCells() {
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
            color: isWeekend ? _accent.withValues(alpha: 0.7) : _textSecondary,
          ),
        ),
      ));
    }

    // Previous month filler days
    int prevMonthDays = _calendar.previousMonth().daysInMonth();
    for (int i = prevMonthDays - prevMonthOffset + 1; i <= prevMonthDays; i++) {
      cells.add(_DayCell(
        ethDay: i,
        gregDay: null,
        isToday: false,
        isCurrentMonth: false,
      ));
    }

    // Current month days
    for (int i = 1; i <= daysInMonth; i++) {
      final gregDay = _getGregorianDay(i);
      cells.add(_DayCell(
        ethDay: i,
        gregDay: gregDay,
        isToday: _isToday(i),
        isCurrentMonth: true,
      ));
    }

    // Next month filler days
    int filled = prevMonthOffset + daysInMonth;
    int totalCells = ((filled / 7).ceil()) * 7;
    for (int i = 1; i <= totalCells - filled; i++) {
      cells.add(_DayCell(
        ethDay: i,
        gregDay: null,
        isToday: false,
        isCurrentMonth: false,
      ));
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_back_ios_rounded,
                size: 16, color: _textPrimary),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Ethiopian Calendar',
          style: TextStyle(
            color: _textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),

          // Month Navigation
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _changeMonth(-1),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.chevron_left_rounded,
                        color: _textPrimary, size: 26),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeAnim,
                  child: Column(
                    children: [
                      Text(
                        '${_calendar.month_name ?? ''} ${_calendar.year ?? ''}',
                        style: const TextStyle(
                          color: _textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _gregorianSubtitle(),
                        style: const TextStyle(
                          color: _textSecondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _changeMonth(1),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.chevron_right_rounded,
                        color: _textPrimary, size: 26),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Color(0xFFEEEFF3), height: 1),
          ),
          const SizedBox(height: 12),

          // Calendar Grid
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
                  children: _buildCalendarCells(),
                ),
              ),
            ),
          ),

          // Today chip
          Container(
            margin: const EdgeInsets.only(bottom: 24, top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: _accent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.today_rounded, color: _accent, size: 16),
                const SizedBox(width: 8),
                Text(
                  'Today: ${_today.month_name ?? ''} ${_today.day}, ${_today.year}',
                  style: const TextStyle(
                    color: _accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _accent,
        foregroundColor: Colors.white,
        elevation: 4,
        onPressed: () {},
        child: const Icon(Icons.add_rounded, size: 28),
      ),
    );
  }
}

// ─── Day Cell Widget ──────────────────────────────────────────────────────────
class _DayCell extends StatelessWidget {
  final int ethDay;
  final int? gregDay;
  final bool isToday;
  final bool isCurrentMonth;

  const _DayCell({
    required this.ethDay,
    required this.gregDay,
    required this.isToday,
    required this.isCurrentMonth,
  });

  static const Color _accent = Color(0xFF4F6EF7);
  static const Color _textPrimary = Color(0xFF1A1A2E);
  static const Color _textSecondary = Color(0xFF8A8FA8);

  @override
  Widget build(BuildContext context) {
    Color dayColor;
    if (isToday) {
      dayColor = Colors.white;
    } else if (!isCurrentMonth) {
      dayColor = _textSecondary.withValues(alpha: 0.35);
    } else {
      dayColor = _textPrimary;
    }

    return Center(
      child: Container(
        width: 40,
        height: 44,
        decoration: isToday
            ? BoxDecoration(
                color: _accent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: _accent.withValues(alpha: 0.35),
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
                      : _textSecondary.withValues(alpha: 0.65),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
