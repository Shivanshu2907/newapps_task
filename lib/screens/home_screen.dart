import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nowapps_task/main.dart';
import 'package:nowapps_task/screens/first_screen.dart';
import 'package:nowapps_task/widgets/bold_text_widget.dart';
import 'package:nowapps_task/widgets/light_text_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  BoldText boldText = BoldText();

  LightText lightText = LightText();

  late TabController _controller;

  _handleSelected() {
    setState(() {});
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    FirstScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 3);

    _controller.addListener(_handleSelected);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Icon(
                  Icons.location_on,
                  color: Color(0xFFFC7568),
                ),
              ),
              lightText.getText(string: "To, Canada", size: 16)
            ],
          ),
          backgroundColor: const Color(0xFFEAEFFB),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.sort,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Icon(
                Icons.search,
                color: Color(0xFFFC7568),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                controller: _controller,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Color(0xFFFC7568),
                  ),
                  insets: EdgeInsets.only(left: 10, right: 50),
                ),
                tabs: [
                  Tab(
                    icon: _controller.index == 0
                        ? boldText.getText("Popular", 16)
                        : lightText.getText(string: "Popular", size: 16),
                  ),
                  Tab(
                    icon: _controller.index == 1
                        ? boldText.getText("News", 16)
                        : lightText.getText(string: "News", size: 16),
                  ),
                  Tab(
                    icon: _controller.index == 2
                        ? boldText.getText("Upcoming", 16)
                        : lightText.getText(string: "Upcoming", size: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Container(
                    width: 70,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFC7568),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.house,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  icon: const Icon(
                    Icons.house,
                    size: 25,
                  ),
                  label: '',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    width: 70,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFC7568),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.bookmark_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  icon: const Icon(
                    Icons.bookmark_outline,
                    size: 25,
                  ),
                  label: '',
                  backgroundColor: Colors.green,
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    width: 70,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFC7568),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  icon: const Icon(
                    Icons.person_outline,
                    size: 25,
                  ),
                  label: '',
                  backgroundColor: Colors.purple,
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
