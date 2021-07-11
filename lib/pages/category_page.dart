import 'package:examen_app/models/category.dart';
import 'package:examen_app/pages/meals_page.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryPage extends StatefulWidget {
  final Category category;
  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) => Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(widget.category.strCategory),
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: FadeInImage.memoryNetwork(
                    width: 200,
                    fit: BoxFit.fitWidth,
                    placeholder: kTransparentImage,
                    image: widget.category.strCategoryThumb,
                    imageErrorBuilder: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                ),
                Container(
                  height: 400,
                  width: 300,
                  child: Text(
                    widget.category.strCategoryDescription,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  color: Colors.red,
                  child: Text(
                    'Category Meals',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SearchMeal(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
