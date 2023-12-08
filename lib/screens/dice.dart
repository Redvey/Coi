
import 'package:coindice/consts/consts.dart';
import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';



class DiceScreen extends StatefulWidget {
  DiceScreen({super.key});
  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int num = 1;

  void getRandomNumber(){
    num = Random().nextInt(6)+1 ;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.sp,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: false,
        title: Text("Toss & Dice"),

      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  getRandomNumber();
                });
              }
              ,
              child: Icon(
                  _getDiceIcon(num),
                size: 200.sp,
              ),
            ),
            SizedBox(height: 20.sp,),
            ElevatedButton(

              onPressed: () {
                setState((){
                getRandomNumber();});
              },
              child: Text('Throw Dice',
                style: GoogleFonts.poppins(fontSize: 20.sp,color: Colors.blue),),
            ),
          ],
        ),
      ),

    );


  }
}
IconData _getDiceIcon(int number) {
  switch (number) {
    case 1:
      return DiceIcons.dice1;
    case 2:
      return DiceIcons.dice2;
    case 3:
      return DiceIcons.dice3;
    case 4:
      return DiceIcons.dice4;
    case 5:
      return DiceIcons.dice5;
    case 6:
      return DiceIcons.dice6;
    default:
      return Icons.error;
  }
}
