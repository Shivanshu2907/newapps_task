import 'package:flutter/material.dart';
import 'package:nowapps_task/screens/second_screen.dart';
import 'package:nowapps_task/widgets/light_text_widget.dart';

import '../widgets/bold_text_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  BoldText boldText = BoldText();

  LightText lightText = LightText();

  late TabController _controller;

  _handleSelected() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 3);

    _controller.addListener(_handleSelected);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _controller,
      children: [
        popularTabWidget(context),
        newsTabWidget(),
        upcomingTabWidget(),
      ],
    );
  }

  final List<String> _list = [
    "Drama",
    "Horror",
    "Action",
    "Romance",
    "Animation",
    "Comedy",
    "Family",
  ];
  final List<bool> _selected = List.generate(7, (i) => false);
  final List<String> _titles = [
    "Finding Nemo",
    "Whale Rider",
    "The Little Mermaid",
    "The Meg",
    "Finding Dory",
    "Ponyo",
    "Shark Tale",
  ];
  final List<String> _genre = [
    "Animation | Drama",
    "Drama | Family",
    "Animation | Drama",
    "Comedy | Action",
    "Animation | Comedy",
    "Drama | Family",
    "Family | Horror",
  ];
  final List<String> _rating = [
    "7.6",
    "8.2",
    "5.8",
    "8.7",
    "9.0",
    "6.2",
    "7.4",
  ];
  final List<String> _images = [
    "assets/1.jpeg",
    "assets/2.jpg",
    "assets/3.jpg",
    "assets/4.jpg",
    "assets/5.jpeg",
    "assets/6.jpeg",
    "assets/7.jpg",
  ];

  int last_selected = 0;

  Widget popularTabWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selected[i] ? const Color(0xFFFC7568) : null,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: _selected[i]
                              ? const [
                                  BoxShadow(
                                    color: Color(0xFFC9D8F1),
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0,
                                        2.0), // shadow direction: bottom right
                                  )
                                ]
                              : null,
                        ),
                        child: Center(
                          child: lightText.getText(
                            string: _list[i],
                            size: 13,
                            color: _selected[i] ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selected[last_selected] = false;
                          _selected[i] = true;
                          last_selected = i;
                        });
                      }),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _titles.length,
            itemBuilder: (BuildContext context, int index) {
              return lstItem(context, index);
            },
          ),
        )
      ],
    );
  }

  Widget lstItem(BuildContext context, int i) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(
              title: _titles[i],
              genre: _genre[i],
              rating: _rating[i],
              image: _images[i],
            ),
          ),
        ),
        child: Container(
          height: height * 0.18,
          width: width * 0.8,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFC9D8F1),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  width: width * 0.9,
                  height: height * 0.12,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        boldText.getText(_titles[i], 13),
                        lightText.getText(string: _genre[i], size: 12),
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
                            lightText.getText(string: _rating[i], size: 12),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ), //Container
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: width * 0.25,
                  height: height * 0.16,
                  child: Image.asset(
                    _images[i],
                    fit: BoxFit.fill,
                  ),
                ),
              ), //Container
            ], //<
          ),
        ),
      ),
    );
  }

  Widget newsTabWidget() {
    return Container();
  }

  Widget upcomingTabWidget() {
    return Container();
  }
}
