class CarModel {
  final String id; // Unique identifier for the car.
  final String image; // Image path or URL.
  final String model; // Car model name.
  final String price; // Price as a formatted string (e.g., ₹74,00,000).
  final double rating; // Customer rating (e.g., 4.9).
  final int reviews; // Number of reviews.
  final String seats; // Number of seats (e.g., "5 seats").
  final String horsepower; // Horsepower (e.g., "515 hp").
  final String topSpeed; // Top speed (e.g., "230 km/h").
  final String transmission; // Type of transmission (e.g., "Automatic").

  CarModel({
    required this.id,
    required this.image,
    required this.model,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.seats,
    required this.horsepower,
    required this.topSpeed,
    required this.transmission,
  });

  // Factory method for creating a CarModel from JSON data.
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] as String,
      image: json['image'] as String,
      model: json['model'] as String,
      price: json['price'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'] as int,
      seats: json['seats'] as String,
      horsepower: json['horsepower'] as String,
      topSpeed: json['topSpeed'] as String,
      transmission: json['transmission'] as String,
    );
  }

  // Method for converting a CarModel to JSON format.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'model': model,
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'seats': seats,
      'horsepower': horsepower,
      'topSpeed': topSpeed,
      'transmission': transmission,
    };
  }
}
