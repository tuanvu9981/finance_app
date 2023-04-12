import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  String? selectedItem;
  final expalin_C = TextEditingController();
  final ex = FocusNode();
  final _items = <String>["Food", "Transfer", "Transportation", "Education"];

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {
        
      });
    })
  }

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

  Widget buildDropDown(double screenHeight, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      width: screenWidth * 0.72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 2.0, color: Color(0xffC5C5C5)),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        items: _items
            .map((e) => DropdownMenuItem(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/$e.jpg',
                            height: 50.0,
                            width: 40.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  value: e,
                ))
            .toList(),
        selectedItemBuilder: (context) => _items
            .map(
              (e) => Row(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/$e.jpg',
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    e,
                    style: const TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            )
            .toList(),
        hint: const Text('Name', style: TextStyle(color: Colors.grey)),
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: Container(),
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
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
          buildDropDown(screenHeight, screenWidth),
          const SizedBox(height: 30.0),
          TextField(
            focusNode: ex,
            controller: expalin_C,
            decoration: InputDecoration(
              labelText: 'explain',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              labelStyle: TextStyle(
                fontSize: 17.0,
                color: Colors.grey.shade500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(width: 2.0, color: Color(0xffC5C5C5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(width: 2.0, color: Color(0xffC5C5C5)),
              ),
            ),
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
