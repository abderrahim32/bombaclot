import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? _selectedCity = 'All Cities';
  String? _selectedStatus;
  String? _selectedMark;
  String? _selectedModel;

  final TextEditingController _priceFromController = TextEditingController();
  final TextEditingController _priceToController = TextEditingController();
  final TextEditingController _yearFromController = TextEditingController();
  final TextEditingController _yearToController = TextEditingController();

  bool _saveSearch = false;

  // Sample dropdown values.
  final List<String> _cities = ['All Cities', 'New York', 'Los Angeles', 'Chicago', 'Houston'];
  final List<String> _statuses = ['New', 'Used'];
  final List<String> _marks = ['Toyota', 'Ford', 'BMW', 'Mercedes'];
  final List<String> _models = ['Corolla', 'Mustang', '3 Series', 'C Class'];

  @override
  void dispose() {
    _priceFromController.dispose();
    _priceToController.dispose();
    _yearFromController.dispose();
    _yearToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City Dropdown:
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
              value: _selectedCity,
              items: _cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Status Dropdown:
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              value: _selectedStatus,
              items: _statuses.map((status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Mark Dropdown:
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Mark',
                border: OutlineInputBorder(),
              ),
              value: _selectedMark,
              items: _marks.map((mark) {
                return DropdownMenuItem<String>(
                  value: mark,
                  child: Text(mark),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMark = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Model Dropdown:
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Model',
                border: OutlineInputBorder(),
              ),
              value: _selectedModel,
              items: _models.map((model) {
                return DropdownMenuItem<String>(
                  value: model,
                  child: Text(model),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedModel = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Price Fields.
            const Text(
              'PRICE (USD)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _priceFromController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _priceToController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Year Fields.
            const Text(
              'YEAR',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _yearFromController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _yearToController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Save Search Toggle.
            SwitchListTile(
              title: const Text('Save Search'),
              value: _saveSearch,
              onChanged: (value) {
                setState(() {
                  _saveSearch = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Advance Filter Link.
            GestureDetector(
              onTap: () {
                // Navigate to an advanced filter page or pop-up if required.
                debugPrint("Advance Filter tapped");
              },
              child: const Text(
                'Advance Filter',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Red Search Button.
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // When this red button is pressed, navigate to the Filter Results page.
                  Navigator.pushNamed(context, '/filterResults');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
