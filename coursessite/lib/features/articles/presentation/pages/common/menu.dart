//create a new file Menu.dart

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Index: $currentIndex"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: const Text("Home"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: const Text("About"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: const Text("Contact"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}