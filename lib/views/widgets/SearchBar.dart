// ignore: file_names
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
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
              print("Searching...");
            },
            child: Container(
              padding: EdgeInsets.only(left: 8),
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
