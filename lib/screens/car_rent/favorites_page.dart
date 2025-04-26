import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Sample list of favorite items.
  List<Map<String, String>> favorites = [
    {
      'name': 'Porsche 911 Carrera',
      'price': '\$150,000',
      'year': '2021',
      'image': 'assets/images/porsche.png',
    },
    {
      'name': 'Mercedes S-Class',
      'price': '\$200,000',
      'year': '2020',
      'image': 'assets/images/mercedes_s.png',
    },
    {
      'name': 'Audi R8',
      'price': '\$180,000',
      'year': '2022',
      'image': 'assets/images/audi_r8.png',
    },
    {
      'name': 'Lamborghini Huracán',
      'price': '\$250,000',
      'year': '2021',
      'image': 'assets/images/huracan.png',
    },
  ];

  void _removeFavorite(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          // Subtle gradient background.
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: favorites.isEmpty
            ? Center(
          child: Text(
            "You don't have any favorites yet.",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two cards per row.
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final favorite = favorites[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top image section.
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        child: Image.asset(
                          favorite['image']!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Details section.
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        favorite['name']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${favorite['price']} · ${favorite['year']}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    // Delete button row.
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        onPressed: () => _removeFavorite(index),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
