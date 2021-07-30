import 'package:flutter/material.dart';
import 'package:provider_api_request/pages/PhotoListPage.dart';
import 'package:provider_api_request/pages/PostListPage.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/";

  final String title;
  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(PostListPage.routeName),
              },
              child: Text('See All Posts'),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(PhotoListPage.routeName),
              },
              child: Text('See All Photos'),
            ),
          ],
        ),
      ),
    );
  }
}
