import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: counterDown(),
    );
  }
}

class counterDown extends StatefulWidget {
  const counterDown({super.key});

  @override
  State<counterDown> createState() => _counterDownState();
}

class _counterDownState extends State<counterDown> {

  int secsnumber = 7;
  Timer? repeatedFunc ; // el ? 34an yb2a global var
  start(){
   repeatedFunc = Timer.periodic(const Duration(seconds: 1),
            (timer) {
              setState(() {
                if(secsnumber >0){
                  secsnumber--;
                }
                else{
                  timer.cancel();
                }
              });
        });

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text((secsnumber>0)?    secsnumber.toString().padLeft(2,"0") : "bla bla" ,
           style: const TextStyle( fontSize: 22, color: Colors.white, ),
           ),
           const SizedBox(
            height: 22,
          ),
          const Text("seconds"),
    const SizedBox(
    height: 33,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  start();
                  if(secsnumber == 0){
                    setState(() {
                      secsnumber =4;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const
                      Color.fromARGB(255, 25, 120, 197)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
                child:const Text(
                  "Start",
                  style: TextStyle(fontSize: 27),
                ),
              ),
              const SizedBox(width: 22,),
              ElevatedButton(
                onPressed: () {
                  repeatedFunc!.cancel();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const
                      Color.fromARGB(255, 197, 25, 45)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(9))),
                ),
                child: const Text(
                  "Stop",
                  style: TextStyle(fontSize: 27),
                ),
              ),
            ],
          ),],
      ),
    );
  }
}
