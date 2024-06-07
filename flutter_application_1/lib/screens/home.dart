import 'package:flutter/material.dart';
import '../home_bar.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      toolbarHeight: 100,
      title: Row(
        children: [
          Image.asset(
            'assets/cubtale logo1.png', // Replace with your logo path
            height: 60,
          ),
          SizedBox(width: 10),
          // Consider using a single image for both logos
          // if they have the same design
          Image.asset(
            'assets/Cubtale watermark.png', // Replace with your watermark path
            height: 60,
          ),
          SizedBox(width:500),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Add functionality as needed
              },
              child: Text('Button 1'),
            ),
            SizedBox(width: 10), // Spacing between buttons
            TextButton(
              onPressed: () {
                // Add functionality as needed
              },
              child: Text('Button 2'),
            ),
            SizedBox(width: 10), // Spacing between buttons
            TextButton(
              onPressed: () {
                // Add functionality as needed
              },
              child: Text('Button 3'),
            ),
          ],
        ),
        // Dropdown menu button (replace with your dropdown widget)
        
        ],
      ),
      actions:[IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add functionality as needed
          },
        ),]

    ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            InfoCard(
              title: 'TODAYS NEW USERS',
              content: Column(
                children: [
                  UserRow(name: 'John Doe', email: 'johndoe@gmail.com'),
                  UserRow(name: 'Sammy Johnson', email: 'sammyjohnson@gmail.com'),
                  UserRow(name: 'Pricila Miller', email: 'pricilamiller@gmail.com'),
                ],
              ),
            ),
            InfoCard(title: 'Dummy Card 1', content: Container()),
            InfoCard(title: 'Dummy Card 2', content: Container()),
            InfoCard(title: 'Dummy Card 3', content: Container()),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final Widget content;

  InfoCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[800],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.teal[700]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}

class UserRow extends StatelessWidget {
  final String name;
  final String email;

  UserRow({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(color: Colors.white,fontSize: 8)),
          Text(email, style: TextStyle(color: Colors.white,fontSize: 8)),
          Icon(Icons.arrow_forward_ios, color: Colors.white,size: 8),
        ],
      ),
    );
  }
}
