import "dart:convert";

import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;

import "../models/wallpaper.dart";


const api = "563492ad6f9170000100000121c3f5afb2474f9c86ad618434f36037";

class WallpaperProvider with ChangeNotifier {

  List<Wallpaper> _wallpapers = [];

  List<Wallpaper> get wallpapers {
    return [..._wallpapers];
  }

  List<Wallpaper> _fetchedWallpapers = [];

  List<Wallpaper> get fetchedWallpapers {
    return [..._fetchedWallpapers];
  }

  void getWallpapers({String searchQuery, bool searchWall}) async {

    final url = searchWall == true
    ? "https://api.pexels.com/v1/search?query=$searchQuery&per_page=6&page=1"
    : "https://api.pexels.com/v1/curated?per_page=6&page=1";

    final response = await http.get(
      url,
      headers: {
        "Authorization": api,
      }
    );

    if(!searchWall || searchWall == null) {

      final List<dynamic> photos = await json.decode(response.body)["photos"];

      photos.forEach((item) {
        return _wallpapers.add(
          Wallpaper(
            id: item["id"].toString(),
            imageUrl: item["src"]["original"],
            photographer: item["photographer"],
          ),
        );
      });

      notifyListeners();
    } else {
      searchWallpapers(response);
    }
  }

  void searchWallpapers(http.Response res) async {

    final List<dynamic> fetchedPhotos = await json.decode(res.body)["photos"];

    fetchedPhotos.forEach((item) {
      return _fetchedWallpapers.add(
        Wallpaper(
          id: item["id"].toString(),
          imageUrl: item["src"]["original"],
          photographer: item["photographer"],
        ),
      );
    });

    notifyListeners();
  }
}