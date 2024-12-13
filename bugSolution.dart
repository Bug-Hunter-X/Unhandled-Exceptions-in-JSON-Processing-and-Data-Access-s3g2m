```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Robust JSON handling with type checking:
      if (jsonData is Map && jsonData.containsKey('name') && jsonData['name'] is String){
        final String name = jsonData['name'];
        print('Name: $name');
      } else {
        throw Exception('Invalid JSON structure or missing name field.');
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```