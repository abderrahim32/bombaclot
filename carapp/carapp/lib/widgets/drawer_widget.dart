import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header.
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text(
              'CarApp Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          // Car Shop Section.
          ExpansionTile(
            leading: const Icon(Icons.car_rental),
            title: const Text('Car Shop'),
            children: [
              ListTile(
                leading: const Icon(Icons.directions_car),
                title: const Text('New Cars'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/carShop/new');
                },
              ),
              ListTile(
                leading: const Icon(Icons.car_repair),
                title: const Text('Used Cars'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/carShop/used');
                },
              ),
            ],
          ),

          // Car Rent Section.
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

          // About Section.
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),

          // Logout Section.
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
