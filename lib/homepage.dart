import 'package:flutter/material.dart';
import 'package:flutter_application_2/pageTwo.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  PageController _pageController = PageController();
  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appbar"),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    "olá mundo",
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ),
            ],
          ),
          PageTwo(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavigationBar,
          onTap: (int index) {
            setState(() {
              indexBottomNavigationBar = index;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'page 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'page2',
            )
          ]),
    );
  }
}
