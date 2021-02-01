import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "./widgets/collections.dart";
import "../../common_widgets/search_box.dart";
import "../../common_widgets/wallpaper_grid.dart";
import '../../providers/wallpaper_provider.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    context.read<WallpaperProvider>().getWallpapers(searchWall: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Size mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Wallpapers",
          style: textTheme.headline1,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 40,
            right: 15,
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Collections(),
              SizedBox(
                height: 40,
              ),
              SearchBox(),
              SizedBox(
                height: 40,
              ),
              WallpaperGrid(),
            ],
          ),
        ),
      ),
    );
  }
}