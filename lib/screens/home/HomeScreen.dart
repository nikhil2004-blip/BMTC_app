import 'package:flutter/material.dart';
import 'package:app/screens/home/AppDrawer.dart';
import '../../utility/ServiceButton.dart';
import '../metro/MetroScreen.dart';
import '../bus/BusesScreen.dart';
import 'package:app/screens/cabs/CabsScreen.dart';
class HomeScreen extends StatelessWidget {
  final Function(int) onThemeChanged;

  const HomeScreen({Key? key, required this.onThemeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Bengaluru Travel App[BTA]', style: Theme.of(context).textTheme.displayMedium),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      drawer: AppDrawer(onThemeChanged: onThemeChanged),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ServiceButton(
                icon: Icons.train,
                label: 'Metro',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MetroScreen()));
                },
              ),
              SizedBox(width: 16),
              ServiceButton(
                icon: Icons.directions_bus,
                label: 'Buses',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BusesScreen()));
                },
              ),
              SizedBox(width: 16),
              ServiceButton(
                icon: Icons.local_taxi,
                label: 'Cabs',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CabsScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}