import 'package:flutter/material.dart';
import 'package:space/core/color_app.dart';
import 'package:space/core/planet_detail.dart';
import 'package:space/screens/planet_detail_screen.dart';
import '../core/arrow_button.dart';
import '../core/button_custom.dart';
import 'package:space/core/planet_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 240,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/frame1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorApp.blackWhite, ColorApp.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Which planet\nwould you like to explore?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageView.builder(
                    controller: controller,
                    onPageChanged: (i) => setState(() => currentPage = i),
                    itemCount: planetDetails.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/${planetDetails[index].planetName.toLowerCase()}.png",
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowButton(
                  icon: Icons.arrow_back,
                  onTap: () => controller.previousPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  ),
                ),
                Text(
                  planetDetails[currentPage].planetName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.white,
                  ),
                ),
                ArrowButton(
                  icon: Icons.arrow_forward,
                  onTap: () => controller.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  ),
                ),
              ],
            ),
          ),
          ButtonCustom(
            text: 'Explore ${planetDetails[currentPage].planetName}',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanetDetailScreen(
                    planetData: planetDetails[currentPage],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
