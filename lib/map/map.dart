import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapSample extends StatefulWidget {
  final double lat;
  final double lng;
  final String title;
  final String snippet;

  const MapSample({
    super.key,
    this.lat = 9.0320,
    this.lng = 38.7469,
    this.title = 'Addis Ababa',
    this.snippet = 'Ethiopia',
  });

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _initialCameraPosition;
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _initialCameraPosition = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 13.0,
    );
    _markers = {
      Marker(
        markerId: MarkerId(widget.title),
        position: LatLng(widget.lat, widget.lng),
        infoWindow: InfoWindow(
          title: widget.title,
          snippet: widget.snippet,
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? const Color(0xFF7B96FF) : const Color(0xFF4F6EF7);
    final textPrimary = isDark ? const Color(0xFFE8EAF6) : const Color(0xFF1A1A2E);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios_rounded, color: accent, size: 18),
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
