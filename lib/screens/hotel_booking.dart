import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/screens/booking_success.dart';

class HotelBookingPage extends StatefulWidget {
  final String hotelName;
  final String placeName;
  final double pricePerNight;

  const HotelBookingPage({
    super.key,
    required this.hotelName,
    required this.placeName,
    required this.pricePerNight,
  });

  @override
  State<HotelBookingPage> createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _guestsCtrl = TextEditingController(text: '1');

  DateTime? _checkIn;
  DateTime? _checkOut;
  bool _isLoading = false;

  int get _nights {
    if (_checkIn == null || _checkOut == null) return 0;
    return _checkOut!.difference(_checkIn!).inDays.clamp(0, 999);
  }

  double get _totalPrice => _nights * widget.pricePerNight;

  String _fmtDate(DateTime? d) {
    if (d == null) return 'selectDate'.tr;
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDate({required bool isCheckIn}) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn ? (_checkIn ?? now) : (_checkOut ?? now.add(const Duration(days: 1))),
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkIn = picked;
          if (_checkOut != null && !_checkOut!.isAfter(_checkIn!)) {
            _checkOut = _checkIn!.add(const Duration(days: 1));
          }
        } else {
          _checkOut = picked;
        }
      });
    }
  }

  void _confirmBooking() async {
    if (!_formKey.currentState!.validate()) return;
    if (_checkIn == null || _checkOut == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Please select check-in and check-out dates.'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
      return;
    }
    if (_nights < 1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Check-out must be after check-in.'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() => _isLoading = false);

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BookingSuccessPage(
          hotelName: widget.hotelName,
          placeName: widget.placeName,
          checkIn: _fmtDate(_checkIn),
          checkOut: _fmtDate(_checkOut),
          guests: int.tryParse(_guestsCtrl.text) ?? 1,
          totalPrice: _totalPrice,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _guestsCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final bg = isDark ? const Color(0xFF0F1117) : const Color(0xFFF7F8FC);
    final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;
    final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
    final textSecondary = isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);
    final inputFill = isDark ? const Color(0xFF252840) : const Color(0xFFF0F1F5);
    final appBarBg = isDark ? const Color(0xFF161A27) : Colors.white;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: appBarBg,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: accent.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(Icons.arrow_back_ios_rounded, color: accent, size: 18),
          ),
        ),
        title: Text('bookYourStay'.tr,
          style: TextStyle(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 17, fontFamily: 'Poppins')),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          children: [
            // Hotel info card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48, height: 48,
                    decoration: BoxDecoration(color: accent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                    child: Icon(Icons.hotel_rounded, color: accent, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.hotelName,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: textPrimary, fontFamily: 'Poppins'),
                          overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 2),
                        Row(children: [
                          Icon(Icons.location_on_rounded, size: 12, color: accent),
                          const SizedBox(width: 3),
                          Text(widget.placeName, style: TextStyle(fontSize: 12, color: textSecondary, fontFamily: 'Poppins')),
                        ]),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$${widget.pricePerNight.toStringAsFixed(0)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: accent, fontFamily: 'Poppins')),
                      Text('perNight'.tr, style: TextStyle(fontSize: 11, color: textSecondary, fontFamily: 'Poppins')),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _sectionTitle('Personal Details', textPrimary),
            const SizedBox(height: 12),

            _buildInput(
              controller: _nameCtrl,
              label: 'fullName'.tr,
              icon: Icons.person_outline_rounded,
              accent: accent,
              inputFill: inputFill,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              validator: (v) => (v == null || v.isEmpty) ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 14),
            _buildInput(
              controller: _emailCtrl,
              label: 'emailAddress'.tr,
              icon: Icons.email_outlined,
              accent: accent,
              inputFill: inputFill,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Please enter your email';
                if (!v.contains('@')) return 'Enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 14),
            _buildInput(
              controller: _guestsCtrl,
              label: 'guests'.tr,
              icon: Icons.group_outlined,
              accent: accent,
              inputFill: inputFill,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              keyboardType: TextInputType.number,
              hintText: 'guestsHint'.tr,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Enter number of guests';
                final n = int.tryParse(v);
                if (n == null || n < 1) return 'At least 1 guest';
                return null;
              },
            ),

            const SizedBox(height: 24),
            _sectionTitle('Stay Dates', textPrimary),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _datePicker(
                  label: 'checkIn'.tr,
                  value: _fmtDate(_checkIn),
                  icon: Icons.login_rounded,
                  accent: accent,
                  cardBg: cardBg,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  isDark: isDark,
                  onTap: () => _pickDate(isCheckIn: true),
                )),
                const SizedBox(width: 12),
                Expanded(child: _datePicker(
                  label: 'checkOut'.tr,
                  value: _fmtDate(_checkOut),
                  icon: Icons.logout_rounded,
                  accent: accent,
                  cardBg: cardBg,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  isDark: isDark,
                  onTap: () => _pickDate(isCheckIn: false),
                )),
              ],
            ),

            if (_nights > 0) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accent.withValues(alpha: 0.15), accent.withValues(alpha: 0.05)],
                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: accent.withValues(alpha: 0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('totalPrice'.tr, style: TextStyle(fontSize: 13, color: textSecondary, fontFamily: 'Poppins')),
                        Text('$_nights ${'nights'.tr}', style: TextStyle(fontSize: 12, color: textSecondary, fontFamily: 'Poppins')),
                      ],
                    ),
                    Text('\$${_totalPrice.toStringAsFixed(0)}',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: accent, fontFamily: 'Poppins')),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, MediaQuery.of(context).padding.bottom + 12),
        decoration: BoxDecoration(
          color: cardBg,
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06), blurRadius: 20, offset: const Offset(0, -4))],
        ),
        child: ElevatedButton(
          onPressed: _isLoading ? null : _confirmBooking,
          style: ElevatedButton.styleFrom(
            backgroundColor: accent, foregroundColor: Colors.white, elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          child: _isLoading
            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
            : Text('confirmBooking'.tr, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 16)),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, Color textPrimary) {
    return Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: textPrimary, fontFamily: 'Poppins'));
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color accent,
    required Color inputFill,
    required Color textPrimary,
    required Color textSecondary,
    TextInputType keyboardType = TextInputType.text,
    String? hintText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(color: textPrimary, fontFamily: 'Poppins', fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: accent, size: 20),
        filled: true,
        fillColor: inputFill,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: accent, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.red, width: 2)),
        labelStyle: TextStyle(color: textSecondary, fontFamily: 'Poppins', fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _datePicker({
    required String label,
    required String value,
    required IconData icon,
    required Color accent,
    required Color cardBg,
    required Color textPrimary,
    required Color textSecondary,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    final isSet = value != 'selectDate'.tr;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: isSet ? accent.withValues(alpha: 0.4) : (isDark ? const Color(0xFF2A2D40) : const Color(0xFFE0E2EC))),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, size: 14, color: accent),
              const SizedBox(width: 5),
              Text(label, style: TextStyle(fontSize: 11, color: textSecondary, fontFamily: 'Poppins')),
            ]),
            const SizedBox(height: 6),
            Text(value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSet ? textPrimary : textSecondary,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
