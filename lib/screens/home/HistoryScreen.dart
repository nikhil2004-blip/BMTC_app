import 'package:flutter/material.dart';
class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text(
          "Auto Rickshaw Ride: Pickup: 303 JP Nagar, Destination: 404 Banashankari, Driver: Sanidhya Singh, Estimated Fare: \$15, Pickup Time: 01:00 PM\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Intercity Bus Ticket: From Mysuru to Coimbatore, Tickets: 4, Date: 01-09-2024, Ticket ID: INTER202020\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "XL Cab Ride: Pickup: 22 Richmond Road, Destination: 55 Cunningham Road, Driver: Manjeet Mishra, Estimated Fare: \$35, Pickup Time: 10:00 AM\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Mini Cab Ride: Pickup: 15 Church Street, Destination: 30 Vasanthnagar, Driver: Dhruv Agarwal, Estimated Fare: \$22, Pickup Time: 09:00 AM\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Intracity Bus Ticket: From Majestic to Shanthinagar, Tickets: 1, Date: 20-08-2024, Ticket ID: INTR654321\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Metro Ticket: From K.R. Puram to Baiyappanahalli, Tickets: 2, Date: 15-08-2024, Ticket ID: METRO002\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Mini Cab Ride: Pickup: 10 Brigade Road, Destination: 50 Ulsoor Road, Driver: Bhargav Bhojak, Estimated Fare: \$18, Pickup Time: 08:30 AM\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Intercity Bus Ticket: From Bengaluru to Chennai, Tickets: 2, Date: 25-08-2024, Ticket ID: INTER789101\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Intracity Bus Ticket: From Jayanagar to Koramangala, Tickets: 3, Date: 12-08-2024, Ticket ID: INTR123456\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Metro Ticket: From MG Road to Indiranagar, Tickets: 1, Date: 10-08-2024, Ticket ID: METRO001\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "Auto Rickshaw Ride: Pickup: 101 Hosa Road, Destination: 202 Bellandur, Driver: Naman Jain, Estimated Fare: \$12, Pickup Time: 12:00 PM\n"
              "------------------------------------------------------------------------------------------------------------------------------------------------------\n"
              "XL Cab Ride: Pickup: 45 Kammanahalli, Destination: 77 HBR Layout, Driver: Sagar Raj, Estimated Fare: \$40, Pickup Time: 11:00 AM\n",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}