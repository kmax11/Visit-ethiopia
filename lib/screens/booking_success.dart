import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/screens/MainScreen.dart';

class BookingSuccessPage extends StatelessWidget {
  final String hotelName;
  final String placeName;
  final String checkIn;
  final String checkOut;
  final int guests;
  final double totalPrice;

  const BookingSuccessPage({
    super.key,
    required this.hotelName,
    required this.placeName,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final bg = isDark ? const Color(0xFF0F1117) : const Color(0xFFF7F8FC);
    final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;
    final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
    final textSecondary = isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);
    final divider = isDark ? const Color(0xFF2A2D40) : const Color(0xFFEEEFF3);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Clean Static Checkmark Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent,
                  boxShadow: [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.35),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 54,
                ),
              ),

              const SizedBox(height: 28),

              // Title & Message
              Text(
                'bookingConfirmed'.tr,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: textPrimary,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'bookingSuccessMsg'.tr,
                style: TextStyle(
                  fontSize: 14,
                  color: textSecondary,
                  fontFamily: 'Poppins',
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Booking details card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'bookingDetails'.tr,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _detailRow(
                      icon: Icons.hotel_rounded,
                      label: 'hotelLabel'.tr,
                      value: hotelName,
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      divider: divider,
                      showDivider: true,
                    ),
                    _detailRow(
                      icon: Icons.location_on_rounded,
                      label: 'Destination',
                      value: placeName,
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      divider: divider,
                      showDivider: true,
                    ),
                    _detailRow(
                      icon: Icons.login_rounded,
                      label: 'checkInLabel'.tr,
                      value: checkIn,
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      divider: divider,
                      showDivider: true,
                    ),
                    _detailRow(
                      icon: Icons.logout_rounded,
                      label: 'checkOutLabel'.tr,
                      value: checkOut,
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      divider: divider,
                      showDivider: true,
                    ),
                    _detailRow(
                      icon: Icons.group_rounded,
                      label: 'guestsLabel'.tr,
                      value: '$guests',
                      accent: accent,
                      textPrimary: textPrimary,
                      textSecondary: textSecondary,
                      divider: divider,
                      showDivider: true,
                    ),
                    _detailRow(
                      icon: Icons.attach_money_rounded,
                      label: 'totalLabel'.tr,
                      value: '\$${totalPrice.toStringAsFixed(0)}',
                      accent: accent,
                      textPrimary: accent,
                      textSecondary: textSecondary,
                      divider: divider,
                      showDivider: false,
                      valueBold: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'goHome'.tr,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: accent,
                    side: BorderSide(color: accent.withValues(alpha: 0.5)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'bookAnother'.tr,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color accent,
    required Color textPrimary,
    required Color textSecondary,
    required Color divider,
    required bool showDivider,
    bool valueBold = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: accent, size: 16),
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: textSecondary,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    color: textPrimary,
                    fontFamily: 'Poppins',
                    fontWeight: valueBold ? FontWeight.w700 : FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (showDivider) Divider(height: 1, color: divider),
      ],
    );
  }
}
