import 'package:flutter/foundation.dart';

import '../models/collection.dart';

class CollectionProvider with ChangeNotifier {

  final List<Collection> _collections = [

    Collection(
      name: "Abstract",
      imageUrl: "https://images.pexels.com/photos/1585325/pexels-photo-1585325.jpeg?cs=srgb&dl=pexels-steve-johnson-1585325.jpg&fm=jpg",
    ),

    Collection(
      name: "Dark",
      imageUrl: "https://images.pexels.com/photos/164357/pexels-photo-164357.jpeg?cs=srgb&dl=pexels-pixabay-164357.jpg&fm=jpg",
    ),

    Collection(
      name: "Space",
      imageUrl: "https://images.pexels.com/photos/41951/solar-system-emergence-spitzer-telescope-telescope-41951.jpeg?cs=srgb&dl=pexels-pixabay-41951.jpg&fm=jpg",
    ),

    Collection(
      name: "Wild",
      imageUrl: "https://images.pexels.com/photos/47312/tiger-predator-animal-tooth-47312.jpeg?cs=srgb&dl=pexels-pixabay-47312.jpg&fm=jpg",
    ),

    Collection(
      name: "City",
      imageUrl: "https://images.pexels.com/photos/2100018/pexels-photo-2100018.jpeg?cs=srgb&dl=pexels-edwin-jos%C3%A9-vega-ramos-2100018.jpg&fm=jpg",
    ),

    Collection(
      name: "Nature",
      imageUrl: "https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?cs=srgb&dl=pexels-michael-block-3225517.jpg&fm=jpg",
    ),
  ];

  List<Collection> get collections {
    return [..._collections];
  }

  notifyListeners();
}