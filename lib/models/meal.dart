class Meal {
  final String strMeal;
  final String strMealThumb;

  const Meal({
    required this.strMeal,
    required this.strMealThumb,
  });

  static Meal fromJson(json) => Meal(
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'],
      );
}
