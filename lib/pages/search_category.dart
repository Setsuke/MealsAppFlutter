import 'package:examen_app/apis/categories_api.dart';
import 'package:examen_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'category_page.dart';

class SearchCategory extends StatefulWidget {
  List<Category>? get categories => null;
  @override
  _SearchCategoryState createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
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
          title: Text('Categories'),
        ),
        body: FutureBuilder<List<Category>>(
          future: CategoriesApi.getCategories(),
          builder: (context, snapshot) {
            final categories = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  return buildsCategories(categories!);
                }
            }
          },
        ),
      ),
    );
  }

  Widget buildsCategories(List<Category> categories) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.white,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CategoryPage(category: category),
                  )),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FadeInImage.memoryNetwork(
                          width: 80,
                          fit: BoxFit.fill,
                          placeholder: kTransparentImage,
                          image: (category.strCategoryThumb),
                          imageErrorBuilder: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                  title: Text(category.strCategory),
                ),
              ],
            ),
          );
        },
      );
}
