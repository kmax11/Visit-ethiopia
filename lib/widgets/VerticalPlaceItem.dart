import 'package:flutter/material.dart';
import '../screens/details.dart';

class VerticalPlaceItem extends StatelessWidget {
  final Map place;
  final int index;

  const VerticalPlaceItem({super.key, required this.index, required this.place});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;
    final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
    final textSecondary = isDark ? const Color(0xFFB0B3C6) : Colors.blueGrey[400]!;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Details(index: index))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.06),
              blurRadius: 12, offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "${place["img"][0]}",
                height: 80, width: 80, fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${place["name"]}",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, fontFamily: 'Poppins', color: textPrimary),
                    maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded, size: 13, color: accent),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          "${place["location"]}",
                          style: TextStyle(fontSize: 12, color: textSecondary, fontFamily: 'Poppins'),
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (place.containsKey('category'))
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "${place["category"]}",
                        style: TextStyle(fontSize: 10, color: accent, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                      ),
                    ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: textSecondary, size: 20),
          ],
        ),
      ),
    );
  }
}
