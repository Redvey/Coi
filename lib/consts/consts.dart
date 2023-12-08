import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coindice/provider/themesprovider.dart';
import 'package:coindice/screens/coin.dart';
import 'package:coindice/screens/dice.dart';

class CustomClipperForDrawer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 50,
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<ThemeProvider>(
        builder: (context, instance, _) {
          return ClipPath(
            clipper: CustomClipperForDrawer(),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(instance.isDark
                          ? "https://i.pinimg.com/564x/a6/0d/a2/a60da2c54e274a99af1ad91deadc86d7.jpg" // Replace with dark mode image URL
                          : "https://i.pinimg.com/564x/49/ea/e5/49eae5d2b707be603e22f72908a8cbbb.jpg"), // Replace with light mode image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.gamepad), // Prefix icon
                    title: Text(
                      'Mini Games',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(instance.isDark?"Switch to Light Mode":"Switch to Dark Mode"),
                  leading: Icon(
                    instance.isDark ? Icons.light_mode : Icons.dark_mode,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    instance.toggleTheme();
                  },
                ),
                ListTile(
                  title: Text('Coin Game'),
                  leading: Icon(DiceIcons.dice3), // Icon for dice game
                  onTap: () {


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CoinScreen()),
                        );
                      },
                ),
                ListTile(
                  title: Text('Dice Game'),
                  leading: Icon(DiceIcons.dice3), // Icon for dice game
                  onTap: () {


                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DiceScreen()),
                        );
                      },
                ),
                // Other list tiles for additional options if needed
              ],
            ),
          );
        },
      ),
    );
  }
}







