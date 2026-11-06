import 'package:login_reg/login_page.dart';
import 'package:login_reg/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoginReg',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F7F4),
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF174C3C)),
      ),
      home: LoginPage(),
    );
  }
}
