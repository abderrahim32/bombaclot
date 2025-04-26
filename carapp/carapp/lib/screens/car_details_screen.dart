import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  /// Shows the bottom sheet with the rental form.
  void _showRentalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to expand with the keyboard.
      builder: (BuildContext bottomSheetContext) {
        return const RentalFormSheet();
      },
    );
  }

  /// Original helper for rental detail rows.
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  /// New helper that builds a car detail row with an icon.
  Widget _buildDetailRowWithIcon(IconData icon, String detailText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              detailText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> car =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {
          'model': 'Porsche 911 Carrera',
          'price': 'GBP 98,700.00',
          'image': 'assets/images/porsche_911_carrera.jpg', // Update with your asset path
          'brand': 'Porsche',
          'seats': '4',
          'horsepower': '400 - 500 HP',
          'transmission': 'Automatic',
          'fuelType': 'Gasoline',
          'rentalLocation': 'Downtown',
          'rentalPeriod': '3 days',
          'requirements': "Must be at least 25 years old with a valid driver's license",
        };

    return Scaffold(
      appBar: AppBar(
        title: Text(car['model'] ?? 'Car Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: price and status badges.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car['price'] ?? 'GBP 98,700.00',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Promoted',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'New',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Car image with rounded corners.
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                car['image']!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Car title.
            Text(
              car['model'] ?? 'Porsche 911 Carrera',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Car details with icons.
            _buildDetailRowWithIcon(
              Icons.directions_car,
              'Brand: ${car["brand"] ?? "Not specified"}',
            ),
            _buildDetailRowWithIcon(
              Icons.event_seat,
              'Seats: ${car["seats"] ?? "Not specified"}',
            ),
            _buildDetailRowWithIcon(
              Icons.flash_on,
              'Horsepower: ${car["horsepower"] ?? "Not specified"}',
            ),
            _buildDetailRowWithIcon(
              Icons.settings,
              'Transmission: ${car["transmission"] ?? "Not specified"}',
            ),
            _buildDetailRowWithIcon(
              Icons.local_gas_station,
              'Fuel Type: ${car["fuelType"] ?? "Not specified"}',
            ),
            const SizedBox(height: 20),

            // Rental Information section (unchanged functionality).
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "Rental Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildDetailRow(
              "Pick-Up Location",
              car["rentalLocation"] ?? "Not specified",
            ),
            _buildDetailRow(
              "Rental Period",
              car["rentalPeriod"] ?? "Not specified",
            ),
            _buildDetailRow(
              "Requirements",
              car["requirements"] ??
                  "Must be at least 25 years old with a valid driver's license",
            ),
            const SizedBox(height: 20),

            // 'Rent' button which will display the bottom sheet.
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showRentalForm(context),
                child: const Text('Rent'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RentalFormSheet extends StatefulWidget {
  const RentalFormSheet({Key? key}) : super(key: key);

  @override
  State<RentalFormSheet> createState() => _RentalFormSheetState();
}

class _RentalFormSheetState extends State<RentalFormSheet> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pickupLocationController = TextEditingController();

  // Selected rental dates. Defaults: today and tomorrow.
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 1));

  // Formats the date as "dd-mm-yyyy".
  String _formatFullDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _pickupLocationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // For demonstration: print the chosen dates.
      print('Rental from: ${_formatFullDate(_startDate)} to ${_formatFullDate(_endDate)}');
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Rental Request Submitted")),
      );
    }
  }

  // Shows the CupertinoDatePicker for selecting the start date.
  void _showStartDatePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: _startDate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    _startDate = newDate;
                    if (_endDate.isBefore(_startDate)) {
                      _endDate = _startDate.add(const Duration(days: 1));
                    }
                  });
                },
              ),
            ),
            CupertinoButton(
              child: const Text('Done'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  // Shows the CupertinoDatePicker for selecting the end date.
  void _showEndDatePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: _endDate,
                minimumDate: _startDate.add(const Duration(days: 1)),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    _endDate = newDate;
                  });
                },
              ),
            ),
            CupertinoButton(
              child: const Text('Done'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Adjusts the bottom sheet padding when the keyboard is visible.
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Rental Form",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _pickupLocationController,
                decoration: const InputDecoration(labelText: 'Pick-Up Location'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a pick-up location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Rental Period",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // "From" field.
                  Expanded(
                    child: GestureDetector(
                      onTap: _showStartDatePicker,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("From: ${_formatFullDate(_startDate)}"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // "To" field.
                  Expanded(
                    child: GestureDetector(
                      onTap: _showEndDatePicker,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("To: ${_formatFullDate(_endDate)}"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Submit Rental Request"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
