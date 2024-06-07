import 'package:flutter/material.dart';
import 'search_email.dart';
import 'search_id.dart';


class SearchByDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchByMail()));

              },
              child: Text('Search By Mail'),
            ),
            SizedBox(width: 10), // Spacing between buttons
            TextButton(
              onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchById()));

              },
              child: Text('Search By ID'),
            ),
            SizedBox(width: 10), // Spacing between buttons
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchByDate()));
                
                
                
              },
              child: Text('Search By Date'),
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width: 400, // Adjust the width as needed
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search by Date',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add search functionality
                  },
                  child: Text('Search'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
