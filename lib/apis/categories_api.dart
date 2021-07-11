import 'dart:convert';
import 'package:examen_app/models/category.dart';
import 'package:http/http.dart' as http;

class CategoriesApi {
  static Future<List<Category>> getCategories() async {
    var url = Uri.parse(
        'https://www.themealdb.com/api/json/v2/9973533/categories.php');

    final response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> category = body['categories'];

    return category.map<Category>(Category.fromJson).toList();
  }
}
