// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:wallpaper/views/screens/search.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
    SearchPage({super.key});
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(66, 197, 192, 192),
          border: Border.all(color: const Color.fromARGB(55, 75, 74, 74)),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Search Wallpapers",
                hintStyle: TextStyle(
                  fontSize: 18.5,
                  color: Colors.red,
                ),
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // ignore: avoid_print
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Searchscreen(query: _searchController.text)));
            },
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              child: const Icon(
                Icons.search,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
