import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class IntracityTicketGeneratorScreen extends StatefulWidget {
  @override
  _IntracityTicketGeneratorScreenState createState() => _IntracityTicketGeneratorScreenState();
}

class _IntracityTicketGeneratorScreenState extends State<IntracityTicketGeneratorScreen> {
  String? _selectedOrigin;
  String? _selectedDestination;
  final TextEditingController _numberOfTicketsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  final List<String> stations = [
    "Mysuru", "Chennai", "Hyderabad", "Coimbatore", "Krishnagiri",
    "Tumkur", "Chikmagalur", "Kolar", "Hassan", "Mandya",
    "Dharwad", "Belagavi", "Davangere", "Mangalore", "Kodagu",
    "Ballari", "Raichur", "Bijapur", "Gadag", "Hampi",
    "Bidar", "Hubli", "Shimoga", "Srirangapatna", "Yadgir",
    "Kushalnagar", "Nanjangud", "Channapatna", "Sakleshpur",
    "Krishnarajapuram",
  ];

  final List<String> stands = [
    "Majestic Bus Station ", "Shanthinagar Bus Station",
    "Mysore Road Satellite Bus Station", "Shivajinagar Bus Station",
    "Yeshwantpur Bus Station", "Kengeri Bus Terminal",
    "Koramangala Bus Station", "(BMTC) Bus Depot - 1",
    "Indiranagar Bus Station", "Jayanagar Bus Station",
    "Wilson Garden Bus Station", "RT Nagar Bus Station",
    "Vijayanagar Bus Station", "Madiwala Bus Station",
    "Ashoka Nagar Bus Station",
  ];

  void _generateTicket() {
    String numberOfTickets = _numberOfTicketsController.text;

    if (_selectedOrigin != null && _selectedDestination != null && numberOfTickets.isNotEmpty && _selectedDate != null) {
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
              Text('Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}'),
              SizedBox(height: 16),
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
      _selectedDate = null;
      _dateController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intracity Ticket Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedOrigin,
              decoration: InputDecoration(
                labelText: 'Select Origin',
                border: OutlineInputBorder(),
              ),
              items: stands.map((station) {
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
            GestureDetector(
              onTap: () {
                _showDatePicker(context);
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                    hintText: _selectedDate != null
                        ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                        : 'Pick a date',
                  ),
                ),
              ),
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

  void _showDatePicker(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = _selectedDate ?? now;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(now.year, now.month - 1),
      lastDate: DateTime(now.year + 1),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);
      });
    }
  }
}