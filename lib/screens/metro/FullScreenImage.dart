import 'package:flutter/material.dart';
class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Metro Map')),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.asset('images/map.jpg', fit: BoxFit.cover),
        ),
      ),
    );
  }
}