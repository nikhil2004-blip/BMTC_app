import 'package:flutter/material.dart';
class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile card
            Card(
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'The Bengaluru Travel App (BTA) is a Flutter-based app for navigating Bengaluru, India. It features service buttons for metro, buses, and cabs on the home screen. The metro screen includes a map and ticket generator with a date picker. The buses screen offers intracity and intercity options with ticket booking. The cabs screen lets users choose from mini cabs, XL cabs, and auto-rickshaws, and includes a ride booking screen with estimated travel time and fare.\n\n\n\n'
                      'DEVELOPED BY\n\n'
                      'Nikhil Kumar Yadav(1MS23CS120)\n'
                      'Khushi Singh(1MS23CS088)\n\n'
                      'TOOLS USED\n\n'
                      'flutter\n'
                      'dart\n'
                      'Android Studio',

                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}