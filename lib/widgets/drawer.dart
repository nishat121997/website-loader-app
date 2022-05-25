import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _menuUrl = Uri.parse('https://www.starbucks.com/menu');
final Uri _rewardsUrl = Uri.parse('https://www.starbucks.com/rewards');
final Uri _giftUrl = Uri.parse('https://www.starbucks.com/gift');
final Uri _signIn = Uri.parse(
    'https://www.starbucks.com/account/signin?returnUrl=https%3A%2F%2Fwww.starbucks.com%2Fgift');

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

_launchMenuUrl() async {
  if (!await launchUrl(_menuUrl)) throw 'Could not launch $_menuUrl';
}

_launcRewardUrl() async {
  if (!await launchUrl(_rewardsUrl)) throw 'Could not launch $_rewardsUrl';
}

_launchGiftUrl() async {
  if (!await launchUrl(_giftUrl)) throw 'Could not launch $_giftUrl';
}

_launchSignUrl() async {
  if (!await launchUrl(_signIn)) throw 'Could not launch $_signIn';
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('images/p2.jpg'))),
              child: null,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.coffee),
              onTap: () {
                _launchMenuUrl();
              },
              title: const Text(
                'Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.money),
              onTap: () {
                _launcRewardUrl();
              },
              title: Text(
                'Rewards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              onTap: () {
                _launchGiftUrl();
              },
              title: Text(
                'Gift Cards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: Center(
                child: SizedBox(
                    height: 40,
                    width: 100,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 2, color: Colors.black),
                      ),
                      onPressed: () {
                        _launchSignUrl();
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
