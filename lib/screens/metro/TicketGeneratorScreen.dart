import 'package:flutter/material.dart';
class TicketGeneratorScreen extends StatefulWidget {
  @override
  _TicketGeneratorScreenState createState() => _TicketGeneratorScreenState();
}

class _TicketGeneratorScreenState extends State<TicketGeneratorScreen> {
  String? _selectedOrigin;
  String? _selectedDestination;
  final TextEditingController _numberOfTicketsController = TextEditingController();

  final List<String> stations = [
    "Baiyappanahalli",
    "Banaswadi",
    "Bengaluru International Airport",
    "Challaghatta",
    "Cubbon Park",
    "Dasarahalli",
    "Deepanjali Nagar",
    "Dr. B.R. Ambedkar Station, Vidhana Soudha",
    "Garudacharapalya",
    "Goraguntepalya",
    "Halasuru",
    "Hoodi",
    "Indiranagar",
    "Jalahalli",
    "Jayanagar",
    "Jayaprakash Nagar",
    "Jnanabharathi",
    "Kadugodi",
    "Kengeri",
    "Kengeri Bus Terminal",
    "Konanakunte Cross",
    "Lalbagh",
    "Mahalakshmi",
    "Mysuru Road",
    "Nagasandra",
    "Nallurhalli",
    "National College",
    "Peenya",
    "Rajarajeshwari Nagar",
    "Rashtreeya Vidyalaya Road",
    "Silk Institute",
    "South End Circle",
    "Sri Balagangadharanatha Swamiji Station, Hosahalli",
    "Sri Sathya Sai Hospital",
    "Thalaghattapura",
    "Trinity",
    "Vajarahalli",
    "Yelachenahalli",
    "Yeshwanthpur",
  ];
  void _generateTicket() async {
    String numberOfTickets = _numberOfTicketsController.text;

    if (_selectedOrigin != null && _selectedDestination != null && numberOfTickets.isNotEmpty) {

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(child: Text('Ticket Generated')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('From: $_selectedOrigin'),
              Text('To: $_selectedDestination'),
              Text('Tickets: $numberOfTickets'),
              SizedBox(height: 40),
              Image.asset('images/qr.png', fit: BoxFit.cover),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _resetFields();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ticket Downloaded!')),
                );
              },
              child: Text('Download'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  void _resetFields() {
    setState(() {
      _selectedOrigin = null;
      _selectedDestination = null;
      _numberOfTicketsController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ticket Generator')),
      body: Padding(
        padding: const EdgeInsets.all(.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedOrigin,
              decoration: InputDecoration(
                labelText: 'Select Origin',
                border: OutlineInputBorder(),
              ),
              items: stations.map((station) {
                return DropdownMenuItem<String>(
                  value: station,
                  child: Text(station),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOrigin = value;
                });
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedDestination,
              decoration: InputDecoration(
                labelText: 'Select Destination',
                border: OutlineInputBorder(),
              ),
              items: stations.map((station) {
                return DropdownMenuItem<String>(
                  value: station,
                  child: Text(station),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDestination = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _numberOfTicketsController,
              decoration: InputDecoration(
                labelText: 'Number of Tickets',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateTicket,
              child: Text('Pay and Generate Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}