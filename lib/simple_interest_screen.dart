import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  @override
  _SimpleInterestScreenState createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  double principal = 0;
  double rate = 0;
  double time = 0;
  String result = '';

  // Method to calculate Simple Interest
  void calculateSimpleInterest() {
    double interest = (principal * rate * time) / 100;
    setState(() {
      result = 'Simple Interest: $interest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back navigation
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter Principal (P)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                principal = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Enter Rate of Interest (R)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                rate = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Time (T) in years'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                time = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSimpleInterest,
              child: Text('Calculate Interest'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
