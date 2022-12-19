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
      return const MaterialApp(
         debugShowCheckedModeBanner: false,
         home: MyHomePage(),
      );
   }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

   @override
   Widget build(BuildContext context) {
      return DefaultTextStyle(
         style: Theme
            .of(context)
            .textTheme
            .headline4!,
         child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: const Text('Home Page'),
         ),
      );
   }
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
            title: const Text('選擇困難小飛機'),
         ),
         body: SizedBox(
            child: Stack(
               children: <Widget>[
                  AnimatedPositioned(
                     top: fuck1 && takeOff ?  -250 : 100.0,
                     bottom: fuck2 && takeOff ? -300 : 200.0,
                     left: fuck3 && takeOff ? -100.0 : 162.0,
                     right: fuck4 && takeOff ? -100 : 162.0,
                     duration: const Duration(seconds: 4),
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
                        child: const Text('看結果'),
                        onPressed: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CongratulationPage()),
                           );
                        }
                     ),
                  ),

                  //飛機出發按鈕
                  Center(
                     child: ElevatedButton.icon(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue), foregroundColor: MaterialStateProperty.all(Colors.white)),
                        icon: const Icon(Icons.airplanemode_active, color: Colors.white),
                        label: const Text('出發!!!'),
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

class CongratulationPage extends StatelessWidget {
   const CongratulationPage({super.key});

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            title: const Text('恭喜，您抽中了' + ''),
         ),
         body: Center(
            child: ElevatedButton(
               onPressed: () {
                  Navigator.pop(context);
               },
               child: const Text('回上頁'),
            ),
         ),
      );
   }
}
