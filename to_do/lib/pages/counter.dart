import 'package:flutter/material.dart';
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int x=0;
  void inc(){
    setState(() {
       x++;
    });
   
  }
  final myStyle=TextStyle(fontSize: 40, fontFamily: 'Arial');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Center(child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [Center(child: Text("Count: ", style: myStyle,)) , Center(child: Text(x.toString(), style: myStyle))],))),
            Center(child: ElevatedButton(onPressed: inc, child: Text("clicke me!", style: TextStyle(fontSize: 20),)))
            
          ],
        ),
      ),
    );
  }
}