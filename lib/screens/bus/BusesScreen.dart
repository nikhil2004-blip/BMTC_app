import 'package:flutter/material.dart';
import '../../utility/ServiceButton.dart';
import 'IntracityTicketGeneratorScreen.dart';
import 'package:url_launcher/url_launcher.dart';
class BusesScreen extends StatelessWidget {
  final String intercityUrl = 'https://www.google.com/maps/dir///@13.0220032,77.5716864,15z/data=!4m2!4m1!3e3?entry=ttu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Services')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ServiceButton(
                icon: Icons.directions_bus,
                label: 'Intracity',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IntracityTicketGeneratorScreen()),
                  );
                },
              ),
              SizedBox(width: 20),
              ServiceButton(
                icon: Icons.directions_bus,
                label: 'Intercity',
                onPressed: () async {
                  if (await canLaunch(intercityUrl)) {
                    await launch(intercityUrl);
                  } else {
                    throw 'Could not launch $intercityUrl';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}