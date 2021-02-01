import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../providers/wallpaper_provider.dart";
import "package:cached_network_image/cached_network_image.dart";


class WallpaperGrid extends StatelessWidget {

  final bool search;
  final String searchTitle;

  WallpaperGrid({
    this.search,
    this.searchTitle,
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final wallpaperProvider = Provider.of<WallpaperProvider>(context);

    // final wallpaperMap = search == true ? "photos" : "wallpapers";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          search == true ? searchTitle : "Trending",
          style: textTheme.bodyText1,
        ),
        SizedBox(
          height: 15,
        ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.758, // width / height = 182 / 240
          children: search == true 
          ? wallpaperProvider.fetchedWallpapers.map((item) {
              return GridTile(
                child: Container(
                  key: Key(item.id),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (ctx, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              );
            }).toList()
          : wallpaperProvider.wallpapers.map((item) {
              return GridTile(
                child: Container(
                  key: Key(item.id),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (ctx, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              );
            }).toList(),
          // children: List.generate(
          //   wallpaperProvider.wallpapers.length, 
          //   (index) {
          //     return Container(
          //       key: Key(index.toString()),
          //       decoration: BoxDecoration(
          //         color: Colors.grey.shade300,
          //       ),
          //       child: Image.network(
          //         wallpaperProvider.wallpapers[index].imageUrl,
          //         fit: BoxFit.cover,
          //       ),
          //     );
          //   }
          // ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}