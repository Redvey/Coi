import 'package:coindice/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';



class CoinScreen extends StatefulWidget {
  CoinScreen({Key? key}) : super(key: key);

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  int num = 1;
  String result = '';

  void getRandomNumber() {
    setState(() {
      num = Random().nextInt(2) + 1;
      result = (num == 1) ? 'Heads' : 'Tails';
    });
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getRandomNumber();
              },
              child: Icon(
                _getCoinIcon(num),
                size: 200.sp,
              ),
            ),
            SizedBox(height: 20.sp),
            ElevatedButton(
              onPressed: () {
                getRandomNumber();
              },
              child: Text('Flip Coin',
              style: GoogleFonts.poppins(fontSize: 20.sp,color: Colors.blue),),
            ),
            SizedBox(height: 20.sp),
            Text(
              'Result: $result',
              style: GoogleFonts.poppins(fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCoinIcon(int number) {
    switch (number) {
      case 1:
        return Icons.monetization_on;
      case 2:
        return CupertinoIcons.money_pound;
      default:
        return Icons.error;
    }
  }
}

