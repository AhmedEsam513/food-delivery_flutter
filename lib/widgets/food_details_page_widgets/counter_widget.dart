import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {

  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  int counter = 1;
  void incrementCounter(){
    setState(() {
      counter++;
    });
  }


  void decrementCounter(){
    setState(() {
      if(counter!=1) counter--;
    });
  }


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.remove, size: 22,color: counter==1? Colors.grey:Colors.deepOrange,),
            onPressed: decrementCounter,),
          Text("${counter}",style: themeData.textTheme.headlineSmall),
          IconButton(icon:Icon(Icons.add, size: 22,color: themeData.primaryColor,),onPressed: incrementCounter,),
        ],
      ),
    );
  }
}

