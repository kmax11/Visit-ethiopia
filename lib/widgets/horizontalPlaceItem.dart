import 'package:flutter/material.dart';
import '../screens/details.dart';

class HorizontalPlaceItem extends StatelessWidget {
  final Map place;
  final int index;
  const HorizontalPlaceItem({super.key, required this.place, required this.index});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Details(index: index))),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 14),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.07),
              blurRadius: 14, offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.asset(
                "${place["img"][0]}",
                height: 130, width: 160, fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${place["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 13, fontFamily: 'Poppins',
                      color: isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E),
                    ),
                    maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded, size: 11, color: accent),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          "${place["location"]}",
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark ? const Color(0xFFB0B3C6) : Colors.blueGrey[400],
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
