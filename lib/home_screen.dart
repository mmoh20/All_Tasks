import 'package:flutter/material.dart';

import 'nav_screen1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List icons = [
    const Icon(Icons.person_outline),
    const Icon(Icons.home_outlined),
    const Icon(Icons.filter),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              isScrollable: false,
              tabs: [
                Tab(
                  icon: Icon(Icons.person_outline),
                ),
                Tab(
                  icon: Icon(Icons.home_outlined),
                ),
                Tab(
                  icon: Icon(Icons.filter),
                ),
              ],
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white54,
            currentIndex: _currentIndex,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.filter), label: "Images"),
            ],
          ),
          endDrawer: Drawer(
            backgroundColor: Colors.black,
            width: 250,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor:
                            index.isEven ? Colors.white : Colors.blueGrey),
                    onPressed: () {},
                    child: Text(
                      "List Button Number ${index + 1}",
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        thickness: 2,
                        height: 10,
                        color: Colors.white,
                      ),
                    ),
                itemCount: 20),
          ),
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Home Screen",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const NavScreenOne()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text("Next Page"),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(color: Colors.deepOrange),
                      Container(color: Colors.deepPurple),
                      Container(color: Colors.green),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
