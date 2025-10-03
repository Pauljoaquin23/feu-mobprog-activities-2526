import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeBW {
  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);

    final scheme = const ColorScheme.dark(
      primary: Colors.white, // icons
      onPrimary: Colors.black,
      surface: Colors.black, // surfaces
      onSurface: Colors.white, // text on surfaces
      secondary: Colors.white,
      onSecondary: Colors.black,
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: Colors.black,

   // fonts
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),

 
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        
        titleTextStyle: GoogleFonts.audiowide(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        toolbarTextStyle: GoogleFonts.audiowide(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),

      // tabs fonts/colors
      tabBarTheme: TabBarThemeData(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorColor: Colors.white,
        labelStyle: GoogleFonts.audiowide(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        dividerColor:
            Colors.white12, // shows a divider under tabs
      ),

      // cards and inputs on black
      cardTheme: const CardThemeData(
        color: Colors.black,
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: Colors.white12),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF141414),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Colors.white24),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Colors.white),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),

      iconTheme: const IconThemeData(color: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
