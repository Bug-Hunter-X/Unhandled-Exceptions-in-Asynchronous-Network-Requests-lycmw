```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // Provide more context in the exception
      throw Exception('HTTP Request failed with status: ${response.statusCode}.  Response Body: ${response.body}');
    }
  } on FormatException catch (e) {
    print('Error parsing JSON: $e');
    return null; // Or throw a custom exception
  } on SocketException catch (e) {
    print('Network error: $e');
    return null; // Or throw a custom exception
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; 
  }
}
```