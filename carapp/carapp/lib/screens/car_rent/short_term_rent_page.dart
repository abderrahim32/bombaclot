import 'package:flutter/material.dart';

class ShortTermRentPage extends StatelessWidget {
  const ShortTermRentPage({super.key});

  // Dummy list of cars for short-term rent.
  final List<Map<String, String>> shortTermCars = const [
    {
      'image': 'assets/images/bmw.png',
      'model': 'BMW Series 5',
      'price': 'DA5,000/day',
    },
    {
      'image': 'assets/images/ford_mustang.png',
      'model': 'Ford Mustang GT',
      'price': 'DA8,000/day',
    },
    // Add more cars as needed.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Short Term Rent'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: shortTermCars.length,
        itemBuilder: (context, index) {
          final car = shortTermCars[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  car['image']!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car['model']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        car['price']!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: car,
                          );
                        },
                        child: const Text('View Details'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
