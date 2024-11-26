import 'dart:math';

import 'package:flutter/material.dart';

class CircleAreaScreen extends StatefulWidget {
  @override
  _CircleAreaScreenState createState() => _CircleAreaScreenState();
}

class _CircleAreaScreenState extends State<CircleAreaScreen> {
  final TextEditingController _radiusController = TextEditingController();
  String _result = '';

  void _calculateArea() {
    double radius = double.parse(_radiusController.text);
    double area = pi * radius * radius;

    setState(() {
      _result = 'Area of Circle: $area';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area of Circle Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Radius'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateArea,
              child: Text('Calculate Area'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
