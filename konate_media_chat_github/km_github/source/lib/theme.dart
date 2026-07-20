import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Palette officielle KONATE MEDIA CHAT (orange / blanc / vert)
class KMColors {
  KMColors._();

  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF4F4F4);
  static const Color surfaceLight = Color(0xFFECECEC);

  static const Color primaryGreen = Color(0xFF00A651); // Boutons / messages envoyés
  static const Color primaryGreenDark = Color(0xFF00823F);

  static const Color bubbleReceived = Color(0xFFFFFFFF);
  static const Color bubbleReceivedText = Color(0xFF1A1A1A);

  static const Color accentOrange = Color(0xFFFF6D00); // Notifications / en-têtes
  static const Color accentOrangeDark = Color(0xFFE05E00);

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF7A7A7A);
  static const Color divider = Color(0xFFE4E4E4);

  static const LinearGradient logoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentOrange, primaryGreen],
  );
}

class KMTheme {
  KMTheme._();

  static ThemeData get lightTheme {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: KMColors.background,
      primaryColor: KMColors.primaryGreen,
      colorScheme: base.colorScheme.copyWith(
        primary: KMColors.primaryGreen,
        secondary: KMColors.accentOrange,
        surface: KMColors.surface,
        onPrimary: Colors.white,
        onSurface: KMColors.textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: KMColors.accentOrange,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme).apply(
        bodyColor: KMColors.textPrimary,
        displayColor: KMColors.textPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: KMColors.primaryGreen,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: KMColors.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: KMColors.primaryGreen, width: 1.5),
        ),
        hintStyle: const TextStyle(color: KMColors.textSecondary),
      ),
      dividerColor: KMColors.divider,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: KMColors.primaryGreen,
        foregroundColor: Colors.white,
      ),
    );
  }

  static BoxDecoration sentBubble = BoxDecoration(
    color: KMColors.primaryGreen,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(2),
    ),
  );

  static BoxDecoration receivedBubble = BoxDecoration(
    color: KMColors.bubbleReceived,
    border: Border.all(color: KMColors.divider),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomRight: Radius.circular(16),
      bottomLeft: Radius.circular(2),
    ),
  );
}
