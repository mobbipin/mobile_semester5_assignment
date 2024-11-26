import 'dart:math'; //pievalue

import 'package:flutter/material.dart';

class AreaOfCircle extends StatefulWidget {
  @override
  _AreaOfCircleState createState() => _AreaOfCircleState();
}

class _AreaOfCircleState extends State<AreaOfCircle> {
  double radius = 0;
  String result = '';

  void calculateCircleArea() {
    double area = pi * radius * radius;
    setState(() {
      result = 'Area of Circle: $area';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Area Calculator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter radius (r)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                radius = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateCircleArea,
              child: Text('Calculate Area'),
            ),
          ],
        ),
      ),
    );
  }
}
