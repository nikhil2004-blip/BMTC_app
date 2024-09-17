import 'package:flutter/material.dart';
import '../../utility/ServiceTile.dart';
import 'TripDetailsBottomSheet.dart';
import 'dart:math';
class CabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cab Services')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mini Cab tile
            ServiceTile(
              title: 'Mini Cab',
              description: 'Affordable rides for small groups.',
              icon: Icons.directions_car,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RideBookingScreen(serviceType: 'Mini Cab'),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            // XL Cab tile
            ServiceTile(
              title: 'XL Cab',
              description: 'Spacious rides for bigger groups.',
              icon: Icons.airport_shuttle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RideBookingScreen(serviceType: 'XL Cab'),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            // Auto Rickshaw tile
            ServiceTile(
              title: 'Auto Rickshaw',
              description: 'Quick and economical rides.',
              icon: Icons.electric_rickshaw,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RideBookingScreen(serviceType: 'Auto Rickshaw'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
final List<String> drivers = [
  'Bhargav Bhojak',
  'Dhruv Agarwal',
  'Naman Jain',
  'Sankal Gupta',
  'Manjeet Mishra',
  'Sagar Raj',
  'Sanidhya Singh',
  'Madhav Soni',
  "ojasvi Poonia",
  'Anirudha Mohanty',
  'Yashraj Jha',
  'Aaditya Pratap',
  'Pradeep Singh',
];

String getRandomDriver() {
  final random = Random();
  final index = random.nextInt(drivers.length);
  return drivers[index];
}
class RideBookingScreen extends StatefulWidget {
  final String serviceType;

  const RideBookingScreen({Key? key, required this.serviceType}) : super(key: key);

  @override
  _RideBookingScreenState createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  void _confirmRide() {
    if (_pickupController.text.isNotEmpty && _destinationController.text.isNotEmpty) {
      final selectedDriver = getRandomDriver();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => TripDetailsBottomSheet(
          serviceType: widget.serviceType,
          pickupLocation: _pickupController.text,
          destination: _destinationController.text,
          driverName: selectedDriver,
        ),
      ).whenComplete(() {

        _pickupController.clear();
        _destinationController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.serviceType} Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pickupController,
              decoration: InputDecoration(
                labelText: 'Pickup Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _confirmRide,
              child: Text('Confirm Ride'),
            ),
          ],
        ),
      ),
    );
  }
}