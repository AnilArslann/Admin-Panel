import 'package:flutter/material.dart';

class CustomHomeBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 1000,
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
        ],
      ),
      actions: [
        // Center buttons
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
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add functionality as needed
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Standard app bar height
}
