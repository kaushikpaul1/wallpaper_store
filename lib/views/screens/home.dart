// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:wallpaper/controller/apiOper.dart';
import 'package:wallpaper/model/photosModel.dart';
import 'package:wallpaper/views/widgets/CustomAppBar.dart';
import 'package:wallpaper/views/widgets/SearchBar.dart';
import 'package:wallpaper/views/widgets/CatBlock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PhotosModel> trendingWallList;

// ignore: non_constant_identifier_names
  GetTrendingWallpapers() async {
    trendingWallList = await ApiOperations.getTrendingWallpapers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetTrendingWallpapers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: CustomAppBar(
          word1: "Wallpaper",
          word2: " Store",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(padding: EdgeInsets.all(8.0), child: SearchPage()),
            // SizedBox(
            //   height: 100,
            //   width: MediaQuery.of(context).size.width,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: ((context, index) => const CatBlock()),
                ),
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 633,
              // height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: trendingWallList.length,
                  itemBuilder: ((context, index) => Container(
                        height: 500,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              // height: 500,
                              // width: 50,

                              fit: BoxFit.cover,
                              trendingWallList[index].imgSrc),
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
