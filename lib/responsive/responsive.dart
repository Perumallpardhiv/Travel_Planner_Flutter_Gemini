import 'package:flutter/material.dart';

bool responsiveVisibility({
  required BuildContext context,
  bool phone = true,
  bool tablet = true,
}) {
  final double screenWidth = MediaQuery.of(context).size.width;

  // Check if it's a phone or tablet based on the screen width
  if (phone && screenWidth < 600) {
    return true; // Show the widget on phones
  } else if (tablet && screenWidth >= 600 && screenWidth < 960) {
    return true; // Show the widget on tablets
  } else {
    return false; // Hide the widget for other screen sizes
  }
}
