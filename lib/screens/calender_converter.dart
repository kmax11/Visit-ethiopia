import 'package:flutter/material.dart';

import '../calendar/models/calendar/EthiopianCalendar.dart';
import '../calendar/models/calendar/GregorianCalendar.dart';

enum CalendarMode { ecToGc, gcToEc }

class CalendarConverter extends StatefulWidget {
  const CalendarConverter({super.key});

  @override
  _CalendarConverterState createState() => _CalendarConverterState();
}

class _CalendarConverterState extends State<CalendarConverter> {
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  CalendarMode _selectedMode = CalendarMode.ecToGc;
  String _convertedResult = '';

  void convert() {
    int year = int.tryParse(_yearController.text) ?? 0;
    int month = int.tryParse(_monthController.text) ?? 0;
    int day = int.tryParse(_dayController.text) ?? 0;
    
    

    if (_selectedMode == CalendarMode.ecToGc) {
      var ec = EthiopianCalendar(year: year, month: month, day: day);
      var gc = ec.toGC();
      _convertedResult =
          'Converted to GC: ${gc.month_name}, ${gc.year}, ${gc.day_name}';
    } else {
      var gc = GregorianCalendar(year: year, month: month, day: day);
      var ec = gc.toEc();
      _convertedResult =
          'Converted to EC: ${ec.year}, ${ec.month_name}, ${ec.day}';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Calendar Converter'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Convert from:',
                style: TextStyle(
                  color: isDark ? const Color(0xFF9E9E9E) : Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2A2A3E) : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark ? const Color(0xFF3A3A5E) : Colors.grey[300]!,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<CalendarMode>(
                    value: _selectedMode,
                    isExpanded: true,
                    dropdownColor:
                        isDark ? const Color(0xFF2A2A3E) : Colors.white,
                    style: TextStyle(
                      color: isDark ? const Color(0xFFE0E0E0) : Colors.black87,
                      fontSize: 14,
                    ),
                    onChanged: (mode) {
                      setState(() {
                        _selectedMode = mode!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: CalendarMode.ecToGc,
                        child: Text('Ethiopian Calendar to Gregorian Calendar'),
                      ),
                      DropdownMenuItem(
                        value: CalendarMode.gcToEc,
                        child: Text('Gregorian Calendar to Ethiopian Calendar'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildInputField('Year', _yearController),
              const SizedBox(height: 16),
              _buildInputField('Month', _monthController),
              const SizedBox(height: 16),
              _buildInputField('Day', _dayController),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: convert,
                  child: const Text(
                    'Convert',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              if (_convertedResult.isNotEmpty) ...[
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF4CAF50).withValues(alpha: 0.15)
                        : const Color(0xFF4CAF50).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF4CAF50).withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    _convertedResult,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
    );
  }
}
