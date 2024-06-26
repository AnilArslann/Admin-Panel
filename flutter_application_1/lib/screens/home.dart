import 'package:flutter/material.dart';
import '../home_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHorizontal = true;
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 32.0,
          mainAxisSpacing: 32.0,
          childAspectRatio: 5 / 2, // Adjust the aspect ratio to make the cards smaller
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

  void showCustomMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Custom Menu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/cubtale logo1.png', height: 60),
              const SizedBox(height: 10),
              const Text('Additional information'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class CustomThreeLinesIcon extends StatefulWidget {
  @override
  _CustomThreeLinesIconState createState() => _CustomThreeLinesIconState();
}

class _CustomThreeLinesIconState extends State<CustomThreeLinesIcon> {
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rotationAngle = rotationAngle == 0.0 ? 1.5708 : 0.0;
        });
      },
      child: Transform.rotate(
        angle: rotationAngle, // Rotate 90 degrees if rotationAngle is 1.5708
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin:const  EdgeInsets.symmetric(vertical: 2.0),
              height: 4.0,
              width: 24.0,
              color: Colors.teal,
            );
          }),
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
      height: 20,
      decoration: BoxDecoration(
        color: Colors.teal[800],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.teal[700]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
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
      padding: const EdgeInsets.symmetric(vertical: 2.0), // Adjust the vertical padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 10)), // Adjust the font size
          Text(email, style: const TextStyle(color: Colors.white, fontSize: 10)), // Adjust the font size
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 10), // Adjust the icon size
        ],
      ),
    );
  }
}