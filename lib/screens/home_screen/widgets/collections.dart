import 'dart:ui';

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:cached_network_image/cached_network_image.dart";

import "../../../providers/category_provider.dart";
import "../../../providers/wallpaper_provider.dart";

class Collections extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Collections",
          style: textTheme.bodyText1,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 105,
          child: Consumer<CollectionProvider>(
            builder: (ctx, collProvider, child) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: collProvider.collections.length,
                itemBuilder: (ctx, index) {
                  return Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Provider.of<WallpaperProvider>(context, listen: false).getWallpapers();
                        },
                        child: Container(
                          width: 100,
                          margin: index == (collProvider.collections.length - 1) ? EdgeInsets.all(0.0) : EdgeInsets.only(right: 15,),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: collProvider.collections[index].imageUrl,
                            placeholder: (ctx, progress) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            fit: BoxFit.cover,
                            width: 100,
                            height: 105,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 2.5,
                              sigmaY: 2.5,
                            ),
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  radius: 8,
                                  colors: [
                                    Colors.white.withOpacity(.3),
                                    Colors.transparent,
                                  ],
                                ),
                                border: Border(
                                  top: BorderSide(
                                    width: .75,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  collProvider.collections[index].name.toUpperCase(),
                                  style: textTheme.subtitle1.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}