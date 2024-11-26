import 'package:flutter/material.dart';

class ArithmeticScreen extends StatefulWidget {
  @override
  _ArithmeticScreenState createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  double number1 = 0;
  double number2 = 0;
  String result = '';

  void calculate(String operation) {
    double res = 0;
    if (operation == 'add') {
      res = number1 + number2;
    } else if (operation == 'subtract') {
      res = number1 - number2;
    } else if (operation == 'multiply') {
      res = number1 * number2;
    } else if (operation == 'divide') {
      if (number2 != 0) {
        res = number1 / number2;
      } else {
        res = double.nan;
      }
    }
    setState(() {
      result = 'Result: $res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmetic Operations'),
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
              decoration: InputDecoration(labelText: 'Enter first number'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                number1 = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter second number'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                number2 = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => calculate('add'),
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('subtract'),
                  child: Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('multiply'),
                  child: Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('divide'),
                  child: Text('Divide'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
