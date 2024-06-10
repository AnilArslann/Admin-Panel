import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_bar.dart';

class SearchById extends StatefulWidget {
  @override
  _SearchByIdState createState() => _SearchByIdState();
}

class _SearchByIdState extends State<SearchById> {
   bool showInfo = false;
  String infoText = '';

  void performSearch(String email) {
    // Simulate a search operation
    setState(() {
      showInfo = true;
      infoText = 'Showing results for: $email'; // Update with actual search results
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 800,
          height: 600,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  'Search by Id',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Id',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        performSearch(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      performSearch('sample@example.com');
                    },
                    style: ElevatedButton.styleFrom(
                      padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (showInfo)
                Column(
                  children: [
                    if (Theme.of(context).brightness == Brightness.dark)
                      Image.asset('assets/profile_image_dark.png', height: 200)
                    else
                      Image.asset('assets/profile_image_light.png', height: 200),
                    const SizedBox(height: 20),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [Text(
                                'Name:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'Olivia',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),],),
                              
                              SizedBox(height: 10),
                              Row(children: [ Text(
                                'Surname:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'Starkey',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),],),
                             
                              SizedBox(height: 10),
                              Row(children:[Text(
                                'Verified:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'Yes',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),]),
                              
                            ],
                          ),
                        ),
                        SizedBox(width: 50), 
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children:[
                              Text(
                                'Email:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'oliviastarkey@gmail.com',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),]),
                              SizedBox(height: 10),
                              Row(children: [Text(
                                'Creation Date:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                '01/11/2023',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),],),
                              
                              SizedBox(height: 10),
                              Row(children:[Text(
                                'Account Id:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                '123456',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),]),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
