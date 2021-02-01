import "package:flutter/material.dart";

import '../../common_widgets/search_box.dart';
import '../../common_widgets/wallpaper_grid.dart';

class SearchResultScreen extends StatelessWidget {

  static const routeName = "/search";

  @override
  Widget build(BuildContext context) {

    final searchQuery = ModalRoute.of(context).settings.arguments;
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 40,
            right: 15,
            left: 15,
          ),
          child: Column(
            children: <Widget>[
              SearchBox(searchText: searchQuery,),
              SizedBox(
                height: 40,
              ),
              WallpaperGrid(
                search: true,
                searchTitle: searchQuery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}