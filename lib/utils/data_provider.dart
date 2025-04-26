import 'dart:async';
import 'package:carapp/models/car_model.dart';

class DataProvider {
  // Simulated network delay.
  static const Duration _delay = Duration(seconds: 1);

  // Dummy data for all cars.
  static final List<CarModel> _allCars = [
    CarModel(
      id: '1',
      image: 'assets/images/ford_mustang.png',
      model: 'Ford Mustang GT 2022',
      price: '₹74,00,000',
      rating: 4.9,
      reviews: 80,
      seats: '2 seats',
      horsepower: '515 hp',
      topSpeed: '230 km/h',
      transmission: 'Automatic Transmission',
    ),
    CarModel(
      id: '2',
      image: 'assets/images/mercedes.png',
      model: 'Mercedes Benz S-Class 2023',
      price: '₹1,20,00,000',
      rating: 4.8,
      reviews: 60,
      seats: '4 seats',
      horsepower: '450 hp',
      topSpeed: '250 km/h',
      transmission: 'Automatic Transmission',
    ),
    CarModel(
      id: '3',
      image: 'assets/images/audi.png',
      model: 'Audi A8 2021',
      price: '₹85,00,000',
      rating: 4.7,
      reviews: 55,
      seats: '5 seats',
      horsepower: '400 hp',
      topSpeed: '240 km/h',
      transmission: 'Automatic Transmission',
    ),
  ];

  // Dummy data for new cars.
  static final List<CarModel> _newCars = [
    CarModel(
      id: '4',
      image: 'assets/images/tesla.png',
      model: 'Tesla Model S',
      price: '₹1,50,00,000',
      rating: 4.9,
      reviews: 100,
      seats: '5 seats',
      horsepower: '670 hp',
      topSpeed: '322 km/h',
      transmission: 'Automatic',
    ),
    // Additional new car entries...
  ];

  // Dummy data for used cars.
  static final List<CarModel> _usedCars = [
    CarModel(
      id: '5',
      image: 'assets/images/audi.png',
      model: 'Audi A4 2019',
      price: '₹35,00,000',
      rating: 4.6,
      reviews: 40,
      seats: '5 seats',
      horsepower: '190 hp',
      topSpeed: '240 km/h',
      transmission: 'Automatic',
    ),
    // Additional used car entries...
  ];

  // Dummy data for short-term rental cars.
  static final List<CarModel> _shortTermRentCars = [
    CarModel(
      id: '6',
      image: 'assets/images/bmw.png',
      model: 'BMW Series 5',
      price: '₹5,000/day', // For rental, price is per day.
      rating: 4.7,
      reviews: 50,
      seats: '5 seats',
      horsepower: '300 hp',
      topSpeed: '250 km/h',
      transmission: 'Automatic',
    ),
    // Additional short term rent cars...
  ];

  // Dummy data for long-term rental cars.
  static final List<CarModel> _longTermRentCars = [
    CarModel(
      id: '7',
      image: 'assets/images/mercedes.png',
      model: 'Mercedes GLE',
      price: '₹1,00,000/month', // For rental, price is per month.
      rating: 4.8,
      reviews: 30,
      seats: '5 seats',
      horsepower: '350 hp',
      topSpeed: '240 km/h',
      transmission: 'Automatic',
    ),
    // Additional long term rent cars...
  ];

  /// Simulates fetching all cars from an API.
  Future<List<CarModel>> fetchAllCars() async {
    await Future.delayed(_delay); // Simulate network latency.
    return _allCars;
  }

  /// Simulates fetching new cars from an API.
  Future<List<CarModel>> fetchNewCars() async {
    await Future.delayed(_delay);
    return _newCars;
  }

  /// Simulates fetching used cars from an API.
  Future<List<CarModel>> fetchUsedCars() async {
    await Future.delayed(_delay);
    return _usedCars;
  }

  /// Simulates fetching cars available for short-term rental.
  Future<List<CarModel>> fetchShortTermRentCars() async {
    await Future.delayed(_delay);
    return _shortTermRentCars;
  }

  /// Simulates fetching cars available for long-term rental.
  Future<List<CarModel>> fetchLongTermRentCars() async {
    await Future.delayed(_delay);
    return _longTermRentCars;
  }
}
