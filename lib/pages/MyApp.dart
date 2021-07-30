import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_request/pages/PhotoListPage.dart';
import 'package:provider_api_request/pages/PostDetail.dart';
import 'package:provider_api_request/pages/PostListPage.dart';
import 'package:provider_api_request/providers/PhotoDataProvider.dart';
import 'package:provider_api_request/providers/PostDataProvider.dart';

import 'HomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotoDataProvider>(
          create: (context) => PhotoDataProvider(),
        ),
        ChangeNotifierProvider<PostDataProvider>(
          create: (context) => PostDataProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Provider HTTP Request Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => Colors.blueAccent,
              ),
            ),
          ),
          // scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.blueAccent,
          ),
        ),
        themeMode: ThemeMode.system,
        routes: {
          HomePage.routeName: (context) =>
              HomePage(title: 'Provider HTTP Request Demo'),
          PhotoListPage.routeName: (context) => PhotoListPage(),
          PostListPage.routeName: (context) => PostListPage(),
          PostDetail.routeName: (context) => PostDetail(),
        },
      ),
    );
  }
}
