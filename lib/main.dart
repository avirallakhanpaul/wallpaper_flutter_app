import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:wallpaper_app/providers/wallpaper_provider.dart';

import "providers/category_provider.dart";

import "screens/home_screen/home_screen.dart";
import "./screens/search_result/search_result_screen.dart";

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CollectionProvider>(create: (context) => CollectionProvider(),),
        ChangeNotifierProvider<WallpaperProvider>(create: (context) => WallpaperProvider(),),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 24,
              fontFamily: "Poppins",
              // fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              // fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            subtitle2: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          SearchResultScreen.routeName: (ctx) => SearchResultScreen(),
        },
      ),
    );
  }
}