import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final members = [
      {'name': 'Gezahegn Gulilat', 'icon': Icons.person_rounded},
      {'name': 'Termuze Musa', 'icon': Icons.person_rounded},
      {'name': 'Kidus Asrat', 'icon': Icons.person_rounded},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF4CAF50).withValues(alpha: 0.2),
                    const Color(0xFF2E7D32).withValues(alpha: 0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.landscape_rounded,
                        color: Color(0xFF4CAF50),
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Visit Ethiopia',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4CAF50),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A travel guide app for exploring the beautiful destinations of Ethiopia.',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? const Color(0xFF9E9E9E) : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Group Members',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 14),
            ...members.asMap().entries.map((entry) {
              final i = entry.key;
              final member = entry.value;
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E1E2E) : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark ? const Color(0xFF2A2A3E) : Colors.grey[200]!,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(
                            color: Color(0xFF4CAF50),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      member['name'] as String,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
