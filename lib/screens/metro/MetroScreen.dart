import 'package:flutter/material.dart';
import '../../utility/ServiceButton.dart';
import 'FullScreenImage.dart';
import 'TicketGeneratorScreen.dart';
class MetroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Metro Services')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ServiceButton(
                    icon: Icons.map,
                    label: 'Metro Map',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FullScreenImage()),
                      );
                    },
                  ),
                  SizedBox(width: 16),
                  ServiceButton(
                    icon: Icons.local_activity,
                    label: 'Ticket Generator',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TicketGeneratorScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}