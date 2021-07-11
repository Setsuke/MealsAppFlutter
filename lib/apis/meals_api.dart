import 'dart:convert';
import 'package:examen_app/models/meal.dart';
import 'package:http/http.dart' as http;

class MealsApi {
  static Future<List<Meal>> getMeals() async {
    var url = Uri.parse(
        'https://www.themealdb.com/api/json/v2/9973533/filter.php?c=seafood');

    final response = await http.get(url);
    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> meal = body['meals'];

    return meal.map<Meal>(Meal.fromJson).toList();
  }
}
