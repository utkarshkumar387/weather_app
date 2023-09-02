import 'package:flutter/material.dart';
import 'package:weather_app/modules/map_page/connector/map_page_view_connector.dart';
import 'package:weather_app/modules/weather_page/connector/weatherpage_view_connector.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  HomepageViewState createState() => HomepageViewState();
}

class HomepageViewState extends State<HomepageView> {
  int _selectedIndex = 0;

  final List<IconData> icons = [
    Icons.cloud,
    Icons.map,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = <String>['Weather', 'Map'];
    final widgetOptions = <Widget>[
      const WeatherpageViewConnector(),
      const MapPageViewConnector(),
    ];

    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          title.length,
          (index) => BottomNavigationBarItem(
            icon: SizedBox(
              height: 26,
              width: 26,
              child: Icon(icons[index]),
            ),
            label: title[index],
          ),
        ),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
