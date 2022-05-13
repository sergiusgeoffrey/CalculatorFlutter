// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class history extends StatefulWidget {
  final List<String> numbers;
  const history({Key? key, required this.numbers}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
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
            Text("History",
                style: TextStyle(fontSize: 50, color: Colors.white),
                textAlign: TextAlign.center),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.numbers.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(widget.numbers[index]),
                    background: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        alignment: Alignment.centerLeft,
                        color: Colors.red,
                        child: Icon(Icons.delete_outline)
                      ),
                      secondaryBackground: Container(
                        padding:EdgeInsets.fromLTRB(0, 0, 10, 0),
                        alignment: Alignment.centerRight,
                        color: Colors.green,
                        child: Icon(Icons.check)
                      ),
                      confirmDismiss: (direction) async {
                        if (direction==DismissDirection.endToStart){
                          return false;
                        }else{
                          return true;
                        }
                      },
                      onDismissed: (direction){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${widget.numbers[index]} Dismissed"),
                            ),);
                          setState((){ 
                          widget.numbers.removeAt(index);
                          });
                      },
                    child: ListTile(
                      title: Text(
                        widget.numbers[index],style: TextStyle(fontSize:30,color:Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [],
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
