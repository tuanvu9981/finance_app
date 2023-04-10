import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  Widget buildBackground(double screenHeight, BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: screenHeight * 0.28,
          decoration: const BoxDecoration(
            color: Color(0xff368892),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    const Text(
                      'Adding',
                      style: TextStyle(
                        fontSize: 22.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                      size: 30.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildMainContainer(double screenHeight, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      height: screenHeight * 0.8,
      width: screenWidth * 0.82,
      child: Column(
        children: [
          const SizedBox(height: 50.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 2.0, color: Color(0xffC5C5C5)),
            ),
            // child: DropdownButton(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildBackground(screenHeight, context),
          Positioned(
            top: screenHeight * 0.125,
            child: buildMainContainer(screenHeight, screenWidth),
          )
        ],
      ),
    );
  }
}
