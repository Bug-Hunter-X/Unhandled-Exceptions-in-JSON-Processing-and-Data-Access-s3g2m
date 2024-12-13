```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data - potential error if the JSON structure is unexpected
      final String name = jsonData['name'];
      print('Name: $name');
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // This catch block only handles exceptions during HTTP request.
    // Other runtime errors during JSON processing or data access are not caught.
  }
}
```