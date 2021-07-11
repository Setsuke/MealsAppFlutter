import 'package:examen_app/apis/meals_api.dart';
import 'package:examen_app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchMeal extends StatefulWidget {
  List<Meal>? get meals => null;
  @override
  _SearchMealState createState() => _SearchMealState();
}

class _SearchMealState extends State<SearchMeal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/header_home.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Meals'),
        ),
        body: FutureBuilder<List<Meal>>(
          future: MealsApi.getMeals(),
          builder: (context, snapshot) {
            final meals = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  return buildsMeals(meals!);
                }
            }
          },
        ),
      ),
    );
  }

  Widget buildsMeals(List<Meal> meals) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SearchMeal(),
                  )),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FadeInImage.memoryNetwork(
                          width: 65,
                          fit: BoxFit.fill,
                          placeholder: kTransparentImage,
                          image: (meal.strMealThumb),
                          imageErrorBuilder: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                  title: Text(meal.strMeal),
                ),
              ],
            ),
          );
        },
      );
}
