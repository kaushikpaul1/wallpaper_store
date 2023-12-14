// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_function_literals_in_foreach_calls, duplicate_ignore

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper/model/photosModel.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];

  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"), headers: {
      'Authorization':
          "LJ6MMLt94fPXHMgBzWotITDtD6AfSMe7RDkYfTeJ8cYoPu4cmqz0B4Mq",
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        // Map<String, dynamic> src = element["src"];
        // print(src["portrait"]);
        trendingWallpapers.add(PhotosModel.fromAPI2App(element));
      });
    });
    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          'Authorization':
              "LJ6MMLt94fPXHMgBzWotITDtD6AfSMe7RDkYfTeJ8cYoPu4cmqz0B4Mq",
        // ignore: duplicate_ignore
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapersList.clear();
      // ignore: avoid_function_literals_in_foreach_calls
      photos.forEach((element) {
        // Map<String, dynamic> src = element["src"];
        // print(src["portrait"]);
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));
      });
    });
    return searchWallpapersList;
  }
}
