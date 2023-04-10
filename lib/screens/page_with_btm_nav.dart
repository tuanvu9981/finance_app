import 'package:finance_app/screens/add_screen.dart';
import 'package:finance_app/screens/home.dart';
import 'package:finance_app/screens/statistics.dart';
import 'package:flutter/material.dart';

class PageWithBtmNav extends StatefulWidget {
  const PageWithBtmNav({Key? key}) : super(key: key);

  @override
  PageWithBtmNavState createState() => PageWithBtmNavState();
}

class PageWithBtmNavState extends State<PageWithBtmNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddScreen()),
          );
        },
        backgroundColor: const Color(0xff368983),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: currentIndex == 0 ? const Home() : const Statistics(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 35.0,
                  color: currentIndex == 0 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 35.0,
                  color: currentIndex == 1 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              const SizedBox(width: 15.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 35.0,
                  color: currentIndex == 2 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Icon(
                  Icons.person_outline,
                  size: 35.0,
                  color: currentIndex == 3 ? Color(0xff368983) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
