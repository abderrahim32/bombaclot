import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Removing the "const" keyword to support non-const members.
  HomePage({Key? key}) : super(key: key);

  // Dummy list of car categories.
  final List<String> carCategoriesFrance = const [
    "Citadine",
    "Compacte",
    "Berline",
    "Break",
    "4x4",
    "Monospace",
    "Coupé / Cabriolet",
    "Utilitaire",
    "Électrique / Hybride",
  ];

  // Extended dummy list of car choices with details.
  final List<Map<String, String>> carChoices = [
    {
      'image': 'assets/images/ford_mustang.png', // Ensure the asset exists.
      'model': 'Ford Mustang GT 2022',
      'price': '₹74,00,000',
      'rating': '4.9',
      'reviews': '80 reviews',
      'seats': '2 seats',
      'horsepower': '515 hp',
      'topSpeed': '230 km/h',
      'transmission': 'Automatic Transmission',
    },
    {
      'image': 'assets/images/mercedes.png',
      'model': 'Mercedes Benz S-Class 2023',
      'price': '₹1,20,00,000',
      'rating': '4.8',
      'reviews': '60 reviews',
      'seats': '4 seats',
      'horsepower': '450 hp',
      'topSpeed': '250 km/h',
      'transmission': 'Automatic Transmission',
    },
    // ... additional car entries ...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'CarApp Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Search icon navigates to the Filter page.
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/filter');
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBanner(),
            const SizedBox(height: 16),
            // Car categories horizontal list.
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: carCategoriesFrance.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return Chip(
                    label: Text(
                      carCategoriesFrance[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'POPULAR NEW CARS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Vertical list of car cards.
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: carChoices.length,
              itemBuilder: (context, index) {
                final car = carChoices[index];
                return _buildCarCard(context, car);
              },
            ),
            const SizedBox(height: 24),
            // Extra action buttons.
            _buildExtraButtons(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // Bottom Navigation Bar: Favorites icon (index 3) navigates to '/favorites'
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // Top banner showcasing total cars available.
  Widget _buildTopBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '23,281 Cars for Sale',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'in the UK',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Card widget for each car article.
  Widget _buildCarCard(BuildContext context, Map<String, String> car) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car image section.
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              car['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Car model name.
                Text(
                  car['model']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Rating and Reviews.
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      car['rating']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${car['reviews']})',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Specifications row.
                Row(
                  children: [
                    const Icon(Icons.event_seat, size: 20, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(car['seats']!),
                    const SizedBox(width: 12),
                    const Icon(Icons.speed, size: 20, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(car['horsepower']!),
                    const SizedBox(width: 12),
                    const Icon(Icons.speed_outlined, size: 20, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(car['topSpeed']!),
                  ],
                ),
                const SizedBox(height: 8),
                // Transmission info.
                Text(
                  car['transmission']!,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                // Price.
                Text(
                  car['price']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/details', arguments: car);
                    },
                    child: const Text('View Rental Details'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Extra action buttons row (Filter, Sort, Map View).
  Widget _buildExtraButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/filter');
            },
            icon: const Icon(Icons.filter_list),
            label: const Text("Filter"),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/filter');
            },
            icon: const Icon(Icons.sort),
            label: const Text("Sort"),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/filter');
            },
            icon: const Icon(Icons.map),
            label: const Text("Map View"),
          ),
        ),
      ],
    );
  }

  // Bottom navigation bar accepting the BuildContext.
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(
            child: const Icon(
              Icons.add_circle_outline,
              size: 36,
              color: Colors.blue,
            ),
          ),
          label: 'Add',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        if (index == 2) {
          // Add button.
          Navigator.pushNamed(context, '/add');
        } else if (index == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          // Search button navigates to the Filter page.
          Navigator.pushNamed(context, '/filter');
        } else if (index == 3) {
          // Favorites button navigates to the Favorites page.
          Navigator.pushNamed(context, '/favorites');
        } else if (index == 4) {
          Navigator.pushNamed(context, '/settings');
        }
      },
    );
  }

  // Drawer with rental-related and additional options.
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header with a gradient background.
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Text(
              'CarApp Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Car Rent options.
          ExpansionTile(
            leading: const Icon(Icons.taxi_alert),
            title: const Text('Car Rent'),
            children: [
              ListTile(
                leading: const Icon(Icons.time_to_leave),
                title: const Text('Short Term Rent'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/carRent/shortTerm');
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Long Term Rent'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/carRent/longTerm');
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
