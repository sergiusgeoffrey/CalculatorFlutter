// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class hasilcalc extends StatefulWidget {
  final String rumus;
  final String hasil;
  const hasilcalc({Key? key, required this.rumus, required this.hasil}): super(key: key);

  @override
  State<hasilcalc> createState() => _hasilcalcState();
}

class _hasilcalcState extends State<hasilcalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Hasil Perhitungan",
                style: TextStyle(fontSize: 50, color: Colors.white),
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  widget.rumus,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(height: 20),
                Text(
                  "=" + widget.hasil,
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                
              ),
              child: Text(
                "Go Back",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
