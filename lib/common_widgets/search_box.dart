import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:wallpaper_app/screens/search_result/search_result_screen.dart';

import "../providers/wallpaper_provider.dart";

class SearchBox extends StatelessWidget {

  final String searchText;

  SearchBox({this.searchText});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final searchController = TextEditingController();

    if(searchText != null) {
      searchController.text = searchText;
    }

    void fetchWallpapers(String query) {

      if(query != null) {
        Provider.of<WallpaperProvider>(context, listen: false).getWallpapers(
          searchQuery: query,
          searchWall: true,
        );

        Navigator.of(context).pushNamed(
          SearchResultScreen.routeName,
          arguments: query,
        );
      } else {
        return;
      }
    }

    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: searchController,
              keyboardType: TextInputType.text,
              style: textTheme.subtitle1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: textTheme.subtitle2,
              ),
              onSubmitted: (value) =>fetchWallpapers(searchController.text),
            ),
          ),
          Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              onPressed: () {
                fetchWallpapers(searchController.text);
              },
            ),
          ),
        ],
      ),
    );
    
    // Container(
    //   width: double.infinity,
    //   height: 55,
    //   padding: EdgeInsets.only(
    //     left: 15,
    //   ),
    //   decoration: BoxDecoration(
    //     color: Colors.grey.shade200,
    //   ),
    //   child: Align(
    //     alignment: Alignment.center,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Text(
    //           "Search",
    //           style: TextStyle(
    //             fontFamily: "Poppins",
    //             fontSize: 14,
    //             color: Colors.grey.shade500,
    //           ),
    //         ),
    //         Container(
    //           width: 60,
    //           decoration: BoxDecoration(
    //             border: Border(
    //               left: BorderSide(
    //                 color: Colors.white,
    //                 width: 4,
    //               ),
    //             ),
    //           ),
    //           child: IconButton(
    //             icon: Icon(
    //               Icons.search,
    //               size: 25,
    //             ),
    //             onPressed: () {},
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}