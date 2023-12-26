import 'package:flutter/material.dart';
import 'package:frontend/screens/HomeScreen.dart';
import 'package:frontend/shared/components.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({Key? key}) : super(key: key);

  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  int selectedIconIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          navbar(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/back.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 170, 20),
                    child: Text('Analytics :', style: TextStyle(fontSize: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset('assets/Analytics_img.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 40, 12, 12),
                    child: Image.asset('assets/textstat.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Container(
          height: 75.0,
          decoration: BoxDecoration(
              color: Color(0XFF191931),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildBottomNavBarIcon(0, 'assets/home.png'),
              buildBottomNavBarIcon(1, 'assets/add.png'),
              buildBottomNavBarIcon(2, 'assets/MessageBot.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavBarIcon(int index, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIconIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: selectedIconIndex == index
              ? Color(0XFFB9F95C)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ImageIcon(
          AssetImage(imagePath),
          color: selectedIconIndex == index ? Color(0XFF191931) : Colors.white,
        ),
      ),
    );
  }
}
