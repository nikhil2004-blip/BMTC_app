import 'package:flutter/material.dart';
class ThemeSettings extends StatelessWidget {
  final Function(int) onThemeChanged;

  const ThemeSettings({Key? key, required this.onThemeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Theme')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Theme ${index + 1}'),
            onTap: () {
              onThemeChanged(index);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}