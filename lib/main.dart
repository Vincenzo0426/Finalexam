import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
   @override
   _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context){
      return MaterialApp(
         theme: ThemeData(primarySwatch: Colors.deepPurple),
         debugShowCheckedModeBanner: false,
         home: MyHomePage(),
      );
   }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

   @override
   _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   bool takeOff = false;
   bool fuck1 = false;
   bool fuck2 = false;
   bool fuck3 = false;
   bool fuck4 = false;

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: const Text('選擇困難小飛機(不要連續點喔 會墜機)', style: TextStyle(color: Colors.yellowAccent),),
         ),
         body: SizedBox(
            child: Stack(
               children: [
               //上按鈕
               Positioned(
                  top: 5,
                  left: 171,
                  child: GestureDetector(
                     onTap: () {},
                     child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                           color: Colors.yellowAccent,
                           borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                           child: Text("A", style: TextStyle(color: Colors.deepPurple, fontSize: 25),),
                        ),
                     ),
                  ),
               ),

               //右按鈕
               Positioned(
                  top: 335,
                  right: 10,
                  child: GestureDetector(
                     onTap: () {},
                     child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                           color: Colors.yellowAccent,
                           borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                           child: Text("D", style: TextStyle(color: Colors.deepPurple, fontSize: 25),),
                        ),
                     ),
                  ),
               ),

               //下按鈕
               Positioned(
                  top: 620,
                  left: 171,
                  child: GestureDetector(
                     onTap: () {},
                     child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                           color: Colors.yellowAccent,
                           borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                           child: Text("C" ,style: TextStyle(color: Colors.deepPurple, fontSize: 25),),
                        ),
                     ),
                  ),
               ),

               //左按鈕
               Positioned(
                  top: 335,
                  right: 335,
                  child: GestureDetector(
                     onTap: () {},
                     child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                           color: Colors.yellowAccent,
                           borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                           child: Text("B", style: TextStyle(color: Colors.deepPurple, fontSize: 25),),
                        ),
                     ),
                  ),
               ),

               //動畫
               AnimatedPositioned(
                  top: fuck1 && takeOff ?  -350 : 100.0,
                  bottom: fuck2 && takeOff ? -350 : 200.0,
                  left: fuck3 && takeOff ? -100.0 : 162.0,
                  right: fuck4 && takeOff ? -100 : 162.0,
                  duration: const Duration(seconds: 3),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: const Icon(
                     Icons.airplanemode_active,
                     color: Colors.blueGrey,
                     size: 70.0
                  ),
               ),

               //換頁看結果按鈕
               Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      child: const Text('點這裡把你的想法記起來吧', style: TextStyle(color: Colors.yellowAccent),),
                      onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PageTwo()),
                         );
                      }
                  ),
               ),

               //飛機出發按鈕
               Center(
                  child: ElevatedButton.icon(
                     style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple), foregroundColor: MaterialStateProperty.all(Colors.white)),
                     icon: const Icon(Icons.airplanemode_active, color: Colors.yellowAccent),
                     label: const Text('出發!', style: TextStyle(color: Colors.yellowAccent, fontSize: 20),),
                     onPressed: () => {
                        setState(() {
                           takeOff = !takeOff;
                           if(takeOff){
                              int random = Random().nextInt(4);
                              if (random==0) {
                                 fuck1=true;
                              }
                              if (random==1) {
                                 fuck2=true;
                              }
                              if (random==2) {
                                 fuck3=true;
                              }
                              if (random==3) {
                                 fuck4=true;
                              }
                           }

                           if(!takeOff) {
                              fuck1=false;
                              fuck2=false;
                              fuck3=false;
                              fuck4=false;
                           }
                        })
                     },
                  ),
               )
               ],
            ),
         ),
      );
   }
}

class PageTwo extends StatelessWidget {
   const PageTwo({super.key});


   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: const Text('請輸入你想決定的四個選項', style: TextStyle(color: Colors.yellowAccent),),
         ),
         body:
         Column(
            children: [
               Image.asset("assets/337651.png", width: 350, height: 350,),

               Container(
                  child:
                  TextField(
                     decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.yellowAccent,
                        contentPadding: EdgeInsets.only(left: 0.0, top: 100.0),
                        label: const Text('A:\nB:\nC:\nD:\n', style: TextStyle(color: Colors.black, fontSize: 20),),
                        //hintText: 'A:\nB:\nC:\nD:\n',
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(7),
                        ),
                     ),
                     onChanged: (value) {},
                  ),
               )
            ]
         ),
      );
   }
}

