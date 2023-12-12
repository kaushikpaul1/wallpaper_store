import 'package:flutter/material.dart';
import 'package:wallpaper/views/widgets/CustomAppBar.dart';
import 'package:wallpaper/views/widgets/SearchBar.dart';
import 'package:wallpaper/views/widgets/CatBlock.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchPage(),
            ),
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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 16,
                  itemBuilder: ((context, index) => Container(
                        height: 500,
                        width: 50,
                        color: Colors.amberAccent,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
