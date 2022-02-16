import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nowapps_task/widgets/bold_text_widget.dart';
import 'package:nowapps_task/widgets/light_text_widget.dart';

class SecondScreen extends StatelessWidget {
  String title;
  String genre;
  String rating;
  String image;
  SecondScreen({
    Key? key,
    required this.title,
    required this.genre,
    required this.rating,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    BoldText boldText = BoldText();

    LightText lightText = LightText();
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: height,
          width: width,
          child: Image.asset(
            "assets/background.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height * .75,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(45),
                topLeft: Radius.circular(45),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      boldText.getText(title, 15),
                      const SizedBox(
                        height: 10,
                      ),
                      lightText.getText(
                          string: "Director : Lee unkrick", size: 13),
                      const SizedBox(
                        height: 10,
                      ),
                      lightText.getText(string: "Runtime : 1h:40m", size: 13),
                      const SizedBox(
                        height: 10,
                      ),
                      lightText.getText(string: genre, size: 13),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          lightText.getText(string: rating, size: 13),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      boldText.getText("Plot Summary", 16),
                      const SizedBox(
                        height: 10,
                      ),
                      lightText.getText(
                          string:
                              "After his son gets abducted from the Great Barrier Reef and is dispatched to Sydney, Marlin, a meek clownfish, enlists the help of a forgetful fish and embarks on a journey to bring him home.\nMarlin and Dory exit the East Australian Current and are consumed by a blue whale. Dory tries communicating with the whale.",
                          size: 13),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
                      child: boldText.getText("Cast & Crew", 17),
                    ),
                    lightText.getText(
                      string: "View all",
                      size: 13,
                      color: const Color(0xFFFC7568),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC9D8F1),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: (24),
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset("assets/ellen.jpeg"),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              boldText.getText("Ellen\nDeGeneres", 13)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC9D8F1),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            children: [
                              CircleAvatar(
                                  radius: (24),
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset("assets/alex.jpeg"),
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              boldText.getText("Alexender\ngould", 13)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Container(
                      width: width * 0.85,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFC7568),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFC9D8F1),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Center(
                        child: lightText.getText(
                          string: "Buy Tickets",
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: width * 0.11,
          top: height * 0.194,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            width: width * 0.28,
            height: height * 0.22,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ), //Co

        Positioned(
          left: width * 0.07,
          top: height * 0.08,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              width: 28,
              height: 28,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFFC7568),
                  ),
                ),
              ),
            ),
          ),
        ), //Co
        Positioned(
          right: width * 0.07,
          top: height * 0.08,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: 28,
            height: 28,
            child: const Center(
              child: Icon(
                Icons.bookmark_outline,
                color: Color(0xFFFC7568),
              ),
            ),
          ),
        ),
        Positioned(
          right: width * 0.07,
          top: height * 0.201,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Color(0xFFFC7568),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: 28,
            height: 28,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
