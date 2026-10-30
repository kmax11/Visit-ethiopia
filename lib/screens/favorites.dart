import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/main.dart'; // FavoritesController
import 'package:visitethiopia/theme/app_theme.dart';
import 'package:visitethiopia/screens/details.dart';
import '../util/places.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Reactive read — rebuilds whenever theme or favorites change.
      Get.find<AppThemeController>().isDark;
      final c = AppColors.of(context);
      final ctrl = Get.find<FavoritesController>();
      final favIndices = ctrl.favorites.toList();

      return Scaffold(
        backgroundColor: c.bg,
        appBar: AppBar(
          backgroundColor: c.appBar,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'favorites'.tr,
            style: TextStyle(
              color: c.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontFamily: AppColors.font,
            ),
          ),
        ),
        body: favIndices.isEmpty
            ? _buildEmpty(c)
            : _buildList(context, c, ctrl, favIndices),
      );
    });
  }

  // ── Empty state ────────────────────────────────────────────────────────
  Widget _buildEmpty(AppColors c) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: c.accent.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite_border_rounded,
                  size: 48, color: c.accent.withValues(alpha: 0.5)),
            ),
            const SizedBox(height: 20),
            Text('noFavorites'.tr,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: c.textPrimary,
                    fontFamily: AppColors.font)),
            const SizedBox(height: 10),
            Text('noFavoritesMsg'.tr,
                style: TextStyle(
                    fontSize: 14,
                    color: c.textSecondary,
                    fontFamily: AppColors.font,
                    height: 1.5),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // ── Favorites list ─────────────────────────────────────────────────────
  Widget _buildList(BuildContext context, AppColors c,
      FavoritesController ctrl, List<int> favIndices) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      itemCount: favIndices.length,
      itemBuilder: (context, i) {
        final idx = favIndices[i];
        final place = places[idx];
        final images = place['img'] as List;

        return Dismissible(
          key: ValueKey(idx),
          direction: DismissDirection.endToStart,
          background: Container(
            margin: const EdgeInsets.only(bottom: 14),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.delete_outline_rounded,
                color: Colors.red, size: 28),
          ),
          onDismissed: (_) => ctrl.toggleFavorite(idx),
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => Details(index: idx))),
            child: Container(
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: c.cardBg,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withValues(alpha: c.isDark ? 0.3 : 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(16)),
                    child: Image.asset(
                      images.isNotEmpty ? images[0] : '',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 90,
                        width: 90,
                        color: c.accent.withValues(alpha: 0.1),
                        child: Icon(Icons.image_outlined, color: c.accent),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${place["name"]}'.tr,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: c.textPrimary,
                                  fontFamily: AppColors.font),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 5),
                          Row(children: [
                            Icon(Icons.location_on_rounded,
                                size: 12, color: c.accent),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text('${place["location"]}'.tr,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: c.textSecondary,
                                      fontFamily: AppColors.font),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ]),
                          const SizedBox(height: 7),
                          if (place.containsKey('category'))
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: c.accent.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text('${place["category"]}'.tr,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: c.accent,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppColors.font)),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: GestureDetector(
                      onTap: () => ctrl.toggleFavorite(idx),
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite_rounded,
                            color: Colors.red, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
