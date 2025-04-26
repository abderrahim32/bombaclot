import 'package:flutter/material.dart';

class LongTermRentPage extends StatelessWidget {
  const LongTermRentPage({super.key});

  // Dummy list of cars for long-term rent.
  final List<Map<String, String>> longTermCars = const [
    {
      'image': 'assets/images/tesla.png',
      'model': 'Tesla Model 3',
      'price': 'DA50,000/month',
    },
    {
      'image': 'assets/images/mercedes.png',
      'model': 'Mercedes GLE',
      'price': 'DA1,00,000/month',
    },
    // Add more cars as needed.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long Term Rent'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: longTermCars.length,
        itemBuilder: (context, index) {
          final car = longTermCars[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Car image section.
                Image.asset(
                  car['image']!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                // Car details.
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
                      const SizedBox(height: 8),
                      Text(
                        car['price']!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/details',
                              arguments: car,
                            );
                          },
                          child: const Text('View Details'),
                        ),
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
