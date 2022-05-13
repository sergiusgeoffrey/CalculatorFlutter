// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:simple_calculator/pages/hasilcalc.dart';
import 'package:simple_calculator/pages/history.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String eq = "";
  String result = "";
  String exp = "";
  String expression = "";
  List<String> hist = [];
  btnOnClick(String text) {
    setState(() {
      if (text == "C") {
        eq = "";
        result = "";
      } else if (text == "AC") {
        eq = "";
        result = "";
        exp = "";
        expression = "";
      } else if (text == "<") {
        eq = eq.substring(0, eq.length - 1);
        if (eq == "") {
          eq = "0";
        }
      } else if (text == "=") {
        exp = eq;
        exp = exp.replaceAll('x', '*');
        exp = exp.replaceAll('÷', '/');
        try {
          Parser val = Parser();
          Expression count = val.parse(exp);
          ContextModel model = ContextModel();
          result = '${count.evaluate(EvaluationType.REAL, model)}';
        } catch (e) {
          result = "Error Calculating, Something went wrong";
        }
      } else {
        eq = eq + text;
      }
    });
  }

  Widget button(String text, double fontSize, Color buttonColor) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () {
            btnOnClick(text);
            if (text == '=') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          hasilcalc(rumus: eq, hasil: result)));
              hist.add(result);
            }
          },
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 22, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Calculator - C14190024",
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Calculator - C14190024"),
        ),
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(eq, style: TextStyle(fontSize: 48, color: Colors.grey)),
              Text(result, style: TextStyle(fontSize: 48, color: Colors.white)),
              SizedBox(height: 20),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => history(numbers: hist)));
                    },
                    child: Text(
                      "History",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  );
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('AC', 20, Colors.red),
                  button('C', 25, Colors.red),
                  button('^', 25, Colors.orange),
                  button('<', 25, Colors.grey),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('7', 25, Colors.lightGreen),
                  button('8', 25, Colors.lightGreen),
                  button('9', 25, Colors.lightGreen),
                  button('x', 25, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('4', 25, Colors.lightGreen),
                  button('5', 25, Colors.lightGreen),
                  button('6', 25, Colors.lightGreen),
                  button('-', 25, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('1', 25, Colors.lightGreen),
                  button('2', 25, Colors.lightGreen),
                  button('3', 25, Colors.lightGreen),
                  button('+', 25, Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('.', 25, Colors.green),
                  button('0', 25, Colors.lightGreen),
                  button('/', 25, Colors.orange),
                  button('=', 25, Colors.blue),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
