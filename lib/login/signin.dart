// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:visitethiopia/login/Forget.dart';
import 'package:visitethiopia/login/signup.dart';
import 'package:visitethiopia/main.dart';
import 'package:visitethiopia/screens/MainScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));
    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeCtrl = Get.find<ThemeController>();
      final isDark = themeCtrl.isDark;
      final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
      final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;
      final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
      final textSecondary = isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);
      final inputFill = isDark ? const Color(0xFF252840) : const Color(0xFFF0F1F5);
      final dividerColor = isDark ? const Color(0xFF2A2D40) : const Color(0xFFEEEFF3);
      final dragHandleColor = isDark ? const Color(0xFF2E3248) : const Color(0xFFEEEFF3);

      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Hero background image
            Positioned.fill(
              child: Image.asset(
                'assets/lalibela/lalibela1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            // Dark gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.4, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      isDark ? const Color(0xFF0F1117) : Colors.black,
                    ],
                  ),
                ),
              ),
            ),
            // App logo + name at top center
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.5),
                              width: 1.5),
                        ),
                        child: const Icon(Icons.flight_takeoff_rounded,
                            color: Colors.white, size: 28),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'AntiGravity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Tagline above the card
            Positioned(
              bottom: _cardHeight(context) - 10,
              left: 28,
              right: 28,
              child: Text(
                "Discover Ethiopia's Soul",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Bottom sheet card
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 28,
                      right: 28,
                      top: 32,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 32,
                    ),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Drag handle
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                              color: dragHandleColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Sign in to continue exploring Ethiopia',
                          style: TextStyle(
                            fontSize: 14,
                            color: textSecondary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Email field
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: 'Poppins', color: textPrimary),
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            hintStyle: TextStyle(color: textSecondary, fontSize: 14),
                            prefixIcon: Icon(Icons.email_outlined,
                                color: accent, size: 20),
                            filled: true,
                            fillColor: inputFill,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: accent, width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Password field
                        TextField(
                          obscureText: _obscurePassword,
                          controller: passwordController,
                          style: TextStyle(
                              fontFamily: 'Poppins', color: textPrimary),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: textSecondary, fontSize: 14),
                            prefixIcon: Icon(Icons.lock_outline,
                                color: accent, size: 20),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: textSecondary,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: inputFill,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: accent, width: 2),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                          ),
                        ),

                        // Forgot password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Forget()));
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: accent,
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Login button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accent,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    setState(() => _isLoading = true);
                                    try {
                                      const url =
                                          'https://termuze01.000webhostapp.com/php/login.php';
                                      final data = {
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                      };
                                      final response = await http
                                          .post(Uri.parse(url), body: data);
                                      final parsed = jsonDecode(response.body);
                                      if (parsed["number"] == 1) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MainScreen()),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                const Text('Invalid credentials'),
                                            backgroundColor: Colors.red[700],
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Error: $e'),
                                          backgroundColor: Colors.red[700],
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    } finally {
                                      setState(() => _isLoading = false);
                                    }
                                  },
                            child: _isLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: dividerColor)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'or',
                                style: TextStyle(
                                    color: textSecondary,
                                    fontFamily: 'Poppins',
                                    fontSize: 13),
                              ),
                            ),
                            Expanded(child: Divider(color: dividerColor)),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Sign up row
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: textSecondary,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()),
                                  );
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: accent,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  double _cardHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.52;
  }
}
