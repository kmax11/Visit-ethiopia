
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text(title),
        ),
        body: const Res());
  }
}

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  void sendRequest() async {
    final url =
    Uri.parse('https://termuze01.000webhostapp.com/php/feedbacksend.php');
    final response = await http.post(url, body: {
      'feedback': 'my feedback',
      'otherr': 'value2',
    });
    if (response.statusCode == 200) {
      print('Request successful');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InputButtonWidget(),
    );
  }
}

class InputButtonWidget extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  InputButtonWidget({super.key});

  void _onButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
        final surface = isDark ? const Color(0xFF1C1F2E) : Colors.white;
        final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
        final textSecondary = isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green.withValues(alpha: 0.3), width: 2),
                  ),
                  child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 44),
                ),
                const SizedBox(height: 20),
                Text(
                  'Message Sent!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Your message has been sent successfully. We will get back to you shortly!',
                  style: TextStyle(
                    fontSize: 14,
                    color: textSecondary,
                    fontFamily: 'Poppins',
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Enter input',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _onButtonPressed(context),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class Res extends StatefulWidget {
  const Res({Key? key}) : super(key: key);

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  Future<void> printData() async {
    final response = await http.post(
        Uri.parse('https://termuze01.000webhostapp.com/php/getfeedback.php'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(onPressed: printData),
      ),
    );
  }
}