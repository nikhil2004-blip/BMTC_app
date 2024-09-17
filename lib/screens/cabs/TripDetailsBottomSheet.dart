import 'package:flutter/material.dart';
import 'dart:math';
import 'package:app/screens/cabs/CallScreen.dart';
import 'package:app/screens/cabs/ChatPopupScreen.dart';

class TripDetailsBottomSheet extends StatelessWidget {
  final String serviceType;
  final String pickupLocation;
  final String destination;
  final String driverName;

  TripDetailsBottomSheet({
    required this.serviceType,
    required this.pickupLocation,
    required this.destination,
    required this.driverName,
  });

  int getRandomRating() {
    final random = Random();
    return random.nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    final rating = getRandomRating();
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor, // Use theme background color
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Type: $serviceType',
            style: theme.textTheme.displayMedium,
          ),
          SizedBox(height: 7),
          Text(
            'Pickup Location: $pickupLocation',
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 7),
          Text(
            'Destination: $destination',
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 7),
          Text(
            'Time of trip: 55 Minutes',
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          Text(
            'Driver: $driverName',
            style: theme.textTheme.displayMedium,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.call, color: theme.iconTheme.color), // Use theme icon color
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CallScreen(driverName: driverName),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.chat, color: theme.iconTheme.color), // Use theme icon color
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ChatPopupScreen(driverName: driverName),
                      );
                    },
                  ),
                ],
              ),
              // Rating stars
              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: theme.iconTheme.color, // Use theme icon color
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Color(0xFFF5F5F5), // Use theme card color
              radius: 60,
              child: Icon(Icons.person, color: Colors.grey, size: 100),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFAFAFA), // Use theme button color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
