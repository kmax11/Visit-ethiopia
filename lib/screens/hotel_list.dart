import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/screens/hotel_booking.dart';

const List<String> defaultHotelImages = [
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80',
  'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80',
];

Map<String, List<Map<String, dynamic>>> hotelsByPlace = {
  'Lalibela': [
    {'name': 'Tukul Village Hotel', 'price': 120.0, 'rating': 4.8, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[0]},
    {'name': 'Jerusalem Hotel', 'price': 85.0, 'rating': 4.3, 'amenities': ['WiFi', 'Spa', 'Parking'], 'img': defaultHotelImages[1]},
    {'name': 'Roha Hotel', 'price': 70.0, 'rating': 4.1, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[2]},
    {'name': 'Ben Abeba Lodge', 'price': 95.0, 'rating': 4.6, 'amenities': ['WiFi', 'Pool', 'Restaurant'], 'img': defaultHotelImages[3]},
  ],
  'Axum': [
    {'name': 'Remhai Hotel', 'price': 90.0, 'rating': 4.4, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[4]},
    {'name': 'Ark Hotel Axum', 'price': 75.0, 'rating': 4.2, 'amenities': ['WiFi', 'Gym', 'Parking'], 'img': defaultHotelImages[5]},
    {'name': 'Kaleb Hotel', 'price': 60.0, 'rating': 3.9, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[6]},
  ],
  'Fasil Ghebbi': [
    {'name': 'Goha Hotel Gondar', 'price': 110.0, 'rating': 4.7, 'amenities': ['WiFi', 'Pool', 'Restaurant'], 'img': defaultHotelImages[7]},
    {'name': 'Circle Hotel Gondar', 'price': 80.0, 'rating': 4.3, 'amenities': ['WiFi', 'Gym', 'Spa'], 'img': defaultHotelImages[8]},
    {'name': 'Taye Belay Hotel', 'price': 65.0, 'rating': 4.0, 'amenities': ['WiFi', 'Parking'], 'img': defaultHotelImages[9]},
  ],
  'Harar Jugol': [
    {'name': 'Ras Hotel Harar', 'price': 95.0, 'rating': 4.5, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[10]},
    {'name': 'Harar Maru Hotel', 'price': 70.0, 'rating': 4.2, 'amenities': ['WiFi', 'Parking'], 'img': defaultHotelImages[11]},
    {'name': 'Belayneh Hotel', 'price': 55.0, 'rating': 3.8, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[0]},
  ],
  'Dallol': [
    {'name': 'Afar Camp Lodge', 'price': 130.0, 'rating': 4.6, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[1]},
    {'name': 'Erta Ale Base Camp', 'price': 80.0, 'rating': 4.0, 'amenities': ['Restaurant'], 'img': defaultHotelImages[2]},
  ],
  'Konso Cultural Landscape': [
    {'name': 'Kanta Lodge', 'price': 100.0, 'rating': 4.5, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[3]},
    {'name': 'Konso Eco Lodge', 'price': 75.0, 'rating': 4.1, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[4]},
  ],
  'Tiya': [
    {'name': 'Addis View Hotel', 'price': 90.0, 'rating': 4.3, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[5]},
    {'name': 'Shashamane Hotel', 'price': 65.0, 'rating': 3.9, 'amenities': ['WiFi', 'Parking'], 'img': defaultHotelImages[6]},
  ],
  'Semien Mountains': [
    {'name': 'Limalimo Lodge', 'price': 200.0, 'rating': 4.9, 'amenities': ['WiFi', 'Restaurant', 'Spa'], 'img': defaultHotelImages[7]},
    {'name': 'Simien Lodge', 'price': 150.0, 'rating': 4.7, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[8]},
    {'name': 'Gich Camp', 'price': 70.0, 'rating': 4.0, 'amenities': ['Restaurant'], 'img': defaultHotelImages[9]},
  ],
  'Ras Dashen': [
    {'name': 'Ras Dashen Hotel', 'price': 110.0, 'rating': 4.5, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[10]},
    {'name': 'Taye Hotel', 'price': 80.0, 'rating': 4.1, 'amenities': ['WiFi', 'Parking'], 'img': defaultHotelImages[11]},
  ],
  'Erta Ale': [
    {'name': 'Afar Tribal Village', 'price': 120.0, 'rating': 4.3, 'amenities': ['Restaurant'], 'img': defaultHotelImages[0]},
    {'name': 'Mekele Touring Hotel', 'price': 90.0, 'rating': 4.0, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[1]},
  ],
  'Nechisar National Park': [
    {'name': 'Swaynes Hotel', 'price': 140.0, 'rating': 4.7, 'amenities': ['WiFi', 'Pool', 'Restaurant'], 'img': defaultHotelImages[2]},
    {'name': 'Arba Minch Paradise Lodge', 'price': 110.0, 'rating': 4.5, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[3]},
    {'name': 'Bekele Molla Arba Minch', 'price': 80.0, 'rating': 4.0, 'amenities': ['WiFi', 'Parking'], 'img': defaultHotelImages[4]},
  ],
  'Bale Mountains National Park': [
    {'name': 'Bale Mountain Lodge', 'price': 180.0, 'rating': 4.8, 'amenities': ['WiFi', 'Restaurant', 'Spa'], 'img': defaultHotelImages[5]},
    {'name': 'Bale Mountains Hotel', 'price': 90.0, 'rating': 4.2, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[6]},
  ],
  'Omo National Park': [
    {'name': 'Omo River Lodge', 'price': 160.0, 'rating': 4.6, 'amenities': ['WiFi', 'Restaurant'], 'img': defaultHotelImages[7]},
    {'name': 'Mago Lodge', 'price': 120.0, 'rating': 4.4, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[8]},
  ],
  'Addis Ababa': [
    {'name': 'Sheraton Addis', 'price': 280.0, 'rating': 4.9, 'amenities': ['WiFi', 'Pool', 'Gym', 'Spa', 'Restaurant', 'Parking'], 'img': defaultHotelImages[9]},
    {'name': 'Hilton Addis Ababa', 'price': 220.0, 'rating': 4.8, 'amenities': ['WiFi', 'Pool', 'Gym', 'Restaurant', 'Parking'], 'img': defaultHotelImages[10]},
    {'name': 'Skylight Hotel', 'price': 170.0, 'rating': 4.6, 'amenities': ['WiFi', 'Pool', 'Restaurant', 'Parking'], 'img': defaultHotelImages[11]},
    {'name': 'Radisson Blu Addis', 'price': 150.0, 'rating': 4.5, 'amenities': ['WiFi', 'Gym', 'Restaurant', 'Parking'], 'img': defaultHotelImages[0]},
    {'name': 'Sapphire Addis Hotel', 'price': 100.0, 'rating': 4.2, 'amenities': ['WiFi', 'Restaurant', 'Parking'], 'img': defaultHotelImages[1]},
  ],
};

List<Map<String, dynamic>> getHotelsForPlace(String placeName) {
  return hotelsByPlace[placeName] ?? hotelsByPlace['Addis Ababa']!;
}

class HotelListPage extends StatelessWidget {
  final String placeName;
  const HotelListPage({super.key, required this.placeName});

  static const Map<String, IconData> _amenityIcons = {
    'WiFi': Icons.wifi_rounded,
    'Pool': Icons.pool_rounded,
    'Gym': Icons.fitness_center_rounded,
    'Spa': Icons.spa_rounded,
    'Restaurant': Icons.restaurant_rounded,
    'Parking': Icons.local_parking_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final bg = isDark ? const Color(0xFF0F1117) : const Color(0xFFF7F8FC);
    final cardBg = isDark ? const Color(0xFF1C1F2E) : Colors.white;
    final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);
    final textSecondary = isDark ? const Color(0xFFB0B3C6) : const Color(0xFF8A8FA8);
    final appBarBg = isDark ? const Color(0xFF161A27) : Colors.white;
    final hotels = getHotelsForPlace(placeName);

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
        title: Column(
          children: [
            Text(
              '${'hotelsIn'.tr} $placeName',
              style: TextStyle(color: textPrimary, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Poppins'),
            ),
            Text('selectHotel'.tr, style: TextStyle(color: textSecondary, fontSize: 11, fontFamily: 'Poppins')),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          final amenities = hotel['amenities'] as List;
          final rating = hotel['rating'] as double;
          final price = hotel['price'] as double;

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.07), blurRadius: 16, offset: const Offset(0, 6))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Stack(
                    children: [
                      (hotel['img'] as String).startsWith('http')
                          ? Image.network(
                              hotel['img'] as String,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: 170,
                                  color: accent.withValues(alpha: 0.1),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: accent,
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (_, __, ___) => Container(
                                height: 170,
                                color: accent.withValues(alpha: 0.15),
                                child: Center(
                                  child: Icon(Icons.hotel_rounded,
                                      size: 60, color: accent.withValues(alpha: 0.4)),
                                ),
                              ),
                            )
                          : Image.asset(
                              hotel['img'] as String,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                height: 170,
                                color: accent.withValues(alpha: 0.15),
                                child: Center(
                                  child: Icon(Icons.hotel_rounded,
                                      size: 60, color: accent.withValues(alpha: 0.4)),
                                ),
                              ),
                            ),
                      Positioned(
                        top: 12, left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(20)),
                          child: Text('\$${price.toStringAsFixed(0)}${'perNight'.tr}',
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                        ),
                      ),
                      Positioned(
                        top: 12, right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.55), borderRadius: BorderRadius.circular(20)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            const Icon(Icons.star_rounded, color: Color(0xFFFFD700), size: 14),
                            const SizedBox(width: 3),
                            Text(rating.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Poppins')),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotel['name'] as String,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textPrimary, fontFamily: 'Poppins')),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.location_on_rounded, size: 13, color: accent),
                        const SizedBox(width: 3),
                        Text(placeName, style: TextStyle(fontSize: 12, color: textSecondary, fontFamily: 'Poppins')),
                      ]),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 7, runSpacing: 6,
                        children: amenities.map((a) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                            decoration: BoxDecoration(color: accent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                              Icon(_amenityIcons[a] ?? Icons.check_circle_outline, size: 11, color: accent),
                              const SizedBox(width: 4),
                              Text(a.toString(), style: TextStyle(fontSize: 11, color: accent, fontWeight: FontWeight.w600, fontFamily: 'Poppins')),
                            ]),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(
                            builder: (_) => HotelBookingPage(
                              hotelName: hotel['name'] as String,
                              placeName: placeName,
                              pricePerNight: price,
                            ),
                          )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accent, foregroundColor: Colors.white, elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          ),
                          child: Text('selectThisHotel'.tr,
                            style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
