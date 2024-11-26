import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  @override
  _SimpleInterestScreenState createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _result = '';

  void _calculateInterest() {
    double principal = double.parse(_principalController.text);
    double rate = double.parse(_rateController.text);
    double time = double.parse(_timeController.text);

    double interest = (principal * rate * time) / 100;

    setState(() {
      _result = 'Simple Interest: $interest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Principal'),
            ),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Rate (%)'),
            ),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Time (years)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateInterest,
              child: Text('Calculate Interest'),
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
