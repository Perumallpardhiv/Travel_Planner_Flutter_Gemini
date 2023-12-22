import 'package:flutter/material.dart';

bool responsiveVisibility({
  required BuildContext context,
  bool phone = true,
  bool tablet = true,
  bool tabletLandscape = true,
}) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final double screenHeight = MediaQuery.of(context).size.height;

  // Check if it's a phone, tablet portrait, or tablet landscape based on the screen width and height
  if (phone && screenWidth < 600) {
    return true; // Show the widget on phones
  } else if (tablet && screenWidth >= 600 && screenWidth < 960) {
    return true; // Show the widget on tablets (portrait)
  } else if (tabletLandscape && screenWidth >= 960 && screenHeight >= 600) {
    return true; // Show the widget on tablets (landscape)
  } else {
    return false; // Hide the widget for other screen sizes
  }
}
