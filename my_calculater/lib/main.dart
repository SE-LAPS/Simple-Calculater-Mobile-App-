import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  String sumText = '';

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  void calculateSum() {
    final firstValue = int.tryParse(firstController.text) ?? 0;
    final secondValue = int.tryParse(secondController.text) ?? 0;
    final sum = firstValue + secondValue;
    setState(() {
      sumText = '$sum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                '1st Value:',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: TextField(
                controller: firstController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                '2nd Value:',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: TextField(
                controller: secondController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            ElevatedButton(
              onPressed: calculateSum,
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              sumText,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
