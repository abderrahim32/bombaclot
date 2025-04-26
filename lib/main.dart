import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/home_page.dart';
import 'screens/car_details_screen.dart';
import 'screens/car_rent/short_term_rent_page.dart';
import 'screens/car_rent/long_term_rent_page.dart';
import 'screens/about_page.dart';

void main() {
  runApp(const CarApp());
}

class CarApp extends StatelessWidget {
  const CarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Start with the login page.
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => HomePage(),
        // The details page retrieves its arguments using ModalRoute.of(context)
        '/details': (context) => const CarDetailsScreen(),
        // Car Rent pages.
        '/carRent/shortTerm': (context) => const ShortTermRentPage(),
        '/carRent/longTerm': (context) => const LongTermRentPage(),
        // About page.
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
