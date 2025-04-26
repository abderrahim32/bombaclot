// Helper functions for filtering, sorting, formatting, and calculations.

/// Filters the list of cars based on the given category.
/// Expects each car entry to have a 'category' key.
List<Map<String, String>> filterCarsByCategory(
    List<Map<String, String>> cars, String category) {
  return cars.where((car) => car['category'] == category).toList();
}

/// Sorts the list of cars by price in ascending order.
/// Assumes the price is stored as a formatted string (e.g., "₹1,20,00,000").
/// This function removes the currency symbol and commas before comparing.
List<Map<String, String>> sortCarsByPrice(List<Map<String, String>> cars) {
  cars.sort((a, b) {
    int priceA = int.parse(a['price']!.replaceAll(RegExp(r'[₹,]'), ''));
    int priceB = int.parse(b['price']!.replaceAll(RegExp(r'[₹,]'), ''));
    return priceA.compareTo(priceB);
  });
  return cars;
}

/// Formats an integer price into a properly formatted string with the ₹ symbol
/// and comma separators (e.g., converting 1200000 to "₹1,200,000").
String formatPrice(int price) {
  return '₹${price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
}

/// Converts a horsepower value into a formatted string (e.g., "515 hp").
String formatHorsepower(int horsepower) {
  return '$horsepower hp';
}

/// Calculates the total rental cost based on the daily price and rental days.
int calculateRentalCost(int dailyPrice, int rentalDays) {
  return dailyPrice * rentalDays;
}

/// Checks the availability status of a car.
/// Returns true if the status is "available" (case-insensitive), false otherwise.
bool checkAvailability(String availabilityStatus) {
  return availabilityStatus.toLowerCase() == 'available';
}
