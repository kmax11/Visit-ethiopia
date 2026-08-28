
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

  void _onButtonPressed() async {
    final String input = textController.text;
    // TODO: Handle button press with input.
    print(input);
    final url =
    Uri.parse('https://termuze01.000webhostapp.com/php/feedbacksend.php');
    final response = await http.post(url, body: {
      'feedback': input,
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
          onPressed: _onButtonPressed,
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