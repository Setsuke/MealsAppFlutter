import 'package:examen_app/models/category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Category category;

  const HomePage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.category.strCategory),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.category.strCategoryThumb),
                radius: 80,
              ),
              const SizedBox(height: 40),
              Text(
                widget.category.strCategory,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 64),
              // ignore: deprecated_member_use
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                color: Colors.red,
                child: Text(
                  'Category Details',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      );
}
