import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_bar.dart';
import 'dart:convert'; 
import 'package:http/http.dart' as http; 
class SearchByDate extends StatefulWidget {
  @override
  _SearchByDateState createState() => _SearchByDateState();
}

class _SearchByDateState extends State<SearchByDate> {
  bool showInfo = false;
  String infoText = '';

  void performSearch(String email) async {
  const String apiUrl = 'https://4t3mnxl8p8.execute-api.us-east-2.amazonaws.com/default/AdminPanelSearch'; // Replace with your actual search endpoint URL

  // Create the request payload
  final Map<String, String> requestPayload = {
    'email': email,
  };

  // Make the HTTP request
  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'

      },
      body: jsonEncode(requestPayload),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      // Process the response data as needed
      setState(() {
        showInfo = true;
        infoText = 'Showing results for: $email\nResponse: ${responseData['result']}';
      });
    } else {
      // If the server did not return a 200 OK response, handle the error
      setState(() {
        showInfo = true;
        infoText = 'Error: ${response.statusCode} - ${response.reasonPhrase}';
      });
    }
  } catch (e) {
    // If there was an error with the request, handle it
    setState(() {
      showInfo = true;
      infoText = 'An error occurred: $e';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomHomeBar(),
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
                child:  Text(
                  'Search by Date',
                  style:  TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
             const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Date',
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
                      performSearch('test@test.com');
                    },
                    
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
