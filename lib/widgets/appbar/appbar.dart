import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const MyAppbar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
        title: Text('AppBar'),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon((Icons.directions_car)),
            ),
            Tab(
              icon: Icon((Icons.directions_bike)),
            ),
            Tab(
              icon: Icon((Icons.directions_bus)),
            )
          ],
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.green,
          indicatorColor: Colors.green,
        ),
      ),
      body: TabBarView(
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_bike),
          Icon(Icons.directions_bus),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 50,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
                size: 50,
              ),
              label: 'Business'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                size: 50,
              ),
              label: 'School'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: onItemTapped,
      ),
    );
  }
}
