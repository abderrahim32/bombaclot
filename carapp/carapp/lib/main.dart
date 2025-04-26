import 'package:flutter/material.dart';
import 'screens/add_car_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/home_page.dart';
import 'screens/car_details_screen.dart';
import 'screens/car_rent/short_term_rent_page.dart';
import 'screens/car_rent/long_term_rent_page.dart';
import 'screens/about_page.dart';
import 'screens/filter_page.dart';
import 'screens/car_rent/favorites_page.dart';

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
        '/details': (context) => const CarDetailsScreen(),
        '/carRent/shortTerm': (context) => const ShortTermRentPage(),
        '/carRent/longTerm': (context) => const LongTermRentPage(),
        '/about': (context) => const AboutPage(),
        '/add': (context) => const AddCarPage(),
        '/filter': (context) => const FilterPage(),
        '/favorites': (context) => const FavoritesPage(),
      },
    );
  }
}
