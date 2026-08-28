import 'package:flutter/material.dart';
import '../map/map.dart';
import '../util/places.dart';
import 'package:visitethiopia/main.dart';
import 'package:get/get.dart';
import 'hotel_list.dart';

class Details extends StatefulWidget {
  final int index;
  const Details({super.key, required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _isSending = false;
  final TextEditingController _feedbackController = TextEditingController();

  final List<Map<String, dynamic>> _tags = [
    {'icon': Icons.confirmation_num_outlined, 'label': 'ticket'},
    {'icon': Icons.hotel_outlined, 'label': 'hotel'},
    {'icon': Icons.restaurant_outlined, 'label': 'meal'},
  ];

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final place = places[widget.index];
    final images = place['img'] as List;

    return Obx(() {
      final themeCtrl = Get.find<ThemeController>();
      final favCtrl = Get.find<FavoritesController>();
      final isDark = themeCtrl.isDark;
      final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
      final bg = isDark ? const Color(0xFF0F1117) : const Color(0xFFF7F8FC);
      final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;
      final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
      final textSecondary = isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);
      final tagBg = isDark ? const Color(0xFF252840) : const Color(0xFFF7F8FC);
      final tagBorder = isDark ? const Color(0xFF2A2D40) : const Color(0xFFEEEFF3);
      final inputFill = isDark ? const Color(0xFF252840) : const Color(0xFFF7F8FC);
      final bottomBarBg = isDark ? const Color(0xFF161A27) : Colors.white;
      final isFav = favCtrl.isFavorite(widget.index);

      return Scaffold(
        backgroundColor: bg,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // Hero sliver
                SliverAppBar(
                  expandedHeight: 340,
                  pinned: true,
                  backgroundColor: isDark ? const Color(0xFF161A27) : Colors.white,
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.35),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 18),
                    ),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () => favCtrl.toggleFavorite(widget.index),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.35),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: isFav ? Colors.red : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final double lat = (place["lat"] as num?)?.toDouble() ?? 9.0320;
                        final double lng = (place["lng"] as num?)?.toDouble() ?? 38.7469;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MapSample(
                              lat: lat,
                              lng: lng,
                              title: '${place["name"]}',
                              snippet: '${place["location"]}',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.35),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.location_on_rounded, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                      child: images.isNotEmpty
                          ? PageView.builder(
                              itemCount: images.length,
                              itemBuilder: (context, i) => Image.asset(images[i], fit: BoxFit.cover),
                            )
                          : Container(color: bg),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name + Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '${place["name"]}',
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: textPrimary, height: 1.2, fontFamily: 'Poppins'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('from'.tr, style: TextStyle(fontSize: 11, color: textSecondary)),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(fontFamily: 'Poppins'),
                                    children: [
                                      TextSpan(text: '\$299',
                                        style: TextStyle(color: accent, fontWeight: FontWeight.w700, fontSize: 20)),
                                      TextSpan(text: 'perTrip'.tr,
                                        style: TextStyle(color: textSecondary, fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Location + stars
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded, size: 15, color: accent),
                            const SizedBox(width: 4),
                            Text('${place["location"]}', style: TextStyle(fontSize: 13, color: textSecondary)),
                            const Spacer(),
                            Row(children: [
                              for (int i = 0; i < 5; i++)
                                Icon(i < 4 ? Icons.star_rounded : Icons.star_half_rounded,
                                  size: 14, color: const Color(0xFFFFD700)),
                              const SizedBox(width: 4),
                              Text('4.5', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textPrimary)),
                            ]),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Tag chips
                        Row(
                          children: _tags.map((tag) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: tagBg,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: tagBorder),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(tag['icon'] as IconData, size: 14, color: accent),
                                  const SizedBox(width: 5),
                                  Text((tag['label'] as String).tr,
                                    style: TextStyle(fontSize: 12, color: textPrimary, fontWeight: FontWeight.w500, fontFamily: 'Poppins')),
                                ],
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 24),

                        // Schedule Overview
                        Text('scheduleOverview'.tr,
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: textPrimary, fontFamily: 'Poppins')),
                        const SizedBox(height: 10),
                        Text('${place["details"]}',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: textSecondary, height: 1.6)),

                        const SizedBox(height: 32),

                        // Feedback
                        Text('leaveReview'.tr,
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: textPrimary, fontFamily: 'Poppins')),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _feedbackController,
                          maxLines: 3,
                          style: TextStyle(color: textPrimary, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            hintText: 'shareExperience'.tr,
                            hintStyle: TextStyle(color: textSecondary, fontSize: 14),
                            filled: true,
                            fillColor: inputFill,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: accent, width: 2),
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Bottom buttons
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.of(context).padding.bottom + 16),
                decoration: BoxDecoration(
                  color: bottomBarBg,
                  boxShadow: [BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                    blurRadius: 20, offset: const Offset(0, -4),
                  )],
                ),
                child: Row(
                  children: [
                    // Message button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: textPrimary,
                          side: BorderSide(color: isDark ? const Color(0xFF2A2D40) : const Color(0xFFE0E2EC), width: 1.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text('message'.tr,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, fontFamily: 'Poppins', color: textPrimary)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Book Now button
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: _isSending
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => HotelListPage(
                                      placeName: '${place["name"]}',
                                    ),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: _isSending
                            ? const SizedBox(height: 20, width: 20,
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                            : Text('bookNow'.tr,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, fontFamily: 'Poppins')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
