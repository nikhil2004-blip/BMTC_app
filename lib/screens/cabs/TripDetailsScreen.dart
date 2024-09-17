import 'package:flutter/material.dart';
import 'package:app/screens/cabs/CabsScreen.dart';
class TripDetailsScreen extends StatelessWidget {
  final String serviceType;
  final String pickupLocation;
  final String destination;

  TripDetailsScreen({
    required this.serviceType,
    required this.pickupLocation,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final randomDriver = getRandomDriver();

    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service Type: $serviceType',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 10),
            Text(
              'Pickup Location: $pickupLocation',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            Text(
              'Destination: $destination',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20),
            Text(
              'Driver: $randomDriver',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}