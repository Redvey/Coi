import 'package:coindice/consts/consts.dart';
import 'package:coindice/screens/coin.dart';
import 'package:coindice/screens/dice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';







class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoinScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color of the button
                  foregroundColor: Colors.white, // Text color of the button
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                ),
                child: Text('🪙'),
              ),
              SizedBox(width: 20), // Add spacing between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiceScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color of the button
                  foregroundColor: Colors.white, // Text color of the button
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('🎲'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



