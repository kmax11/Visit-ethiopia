import 'package:flutter/material.dart';
import 'signin.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent =
        isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final bgColor = isDark ? const Color(0xFF0F1117) : const Color(0xFFF7F8FC);
    final textPrimary =
        isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
    final textSecondary =
        isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);

    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: accent),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: accent.withValues(alpha: 0.4), width: 2),
                ),
                child:
                    Icon(Icons.person_add_rounded, size: 36, color: accent),
              ),
              const SizedBox(height: 20),
              Text(
                'Create Account',
                style: TextStyle(
                  color: textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  letterSpacing: -0.5,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Join and explore Ethiopia's wonders",
                style: TextStyle(
                  fontSize: 14,
                  color: textSecondary,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),

              // Coming-soon banner
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                  border:
                      Border.all(color: Colors.orange.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.construction_rounded,
                        color: Colors.orange, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Registration will be connected to your backend soon. '
                        'For now, use the demo account on the login screen.',
                        style: TextStyle(
                          color: isDark
                              ? Colors.orange[200]
                              : Colors.orange[900],
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),
              TextField(
                controller: fnameController,
                style:
                    TextStyle(color: textPrimary, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person_outline, color: accent),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: lnameController,
                style:
                    TextStyle(color: textPrimary, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Icons.person_outline, color: accent),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style:
                    TextStyle(color: textPrimary, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon:
                      Icon(Icons.email_outlined, color: accent),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                obscureText: _obscurePassword,
                controller: passwordController,
                style:
                    TextStyle(color: textPrimary, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline, color: accent),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: textSecondary,
                    ),
                    onPressed: () => setState(
                        () => _obscurePassword = !_obscurePassword),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Disabled sign-up button (no endpoint yet)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Backend integration coming soon!',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                        backgroundColor: accent,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: textSecondary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Login()),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 14,
                        color: accent,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
