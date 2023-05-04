import 'package:finance_app/models/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  final box = Hive.box<ExpenseData>('data');
  var date = DateTime.now();
  String? selectedItem;
  String? howItem;
  var explain_C = TextEditingController();
  final ex = FocusNode();
  var amount_c = TextEditingController();
  final amount_ = FocusNode();
  final _items = <String>["Food", "Transfer", "Transportation", "Education"];
  final _howItems = <String>["Income", "Expand"];

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
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
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: screenWidth * 0.72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 2.0, color: Color(0xffC5C5C5)),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        items: _items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
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

  Widget buildExplainTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        focusNode: ex,
        controller: explain_C,
        decoration: InputDecoration(
          labelText: 'Explain',
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
    );
  }

  Widget buildAmountTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        decoration: InputDecoration(
          labelText: 'Amount',
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
    );
  }

  Widget buildHowSelect(double screenWidth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: screenWidth * 0.72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(width: 2.0, color: Color(0xffC5C5C5)),
      ),
      child: DropdownButton<String>(
        value: howItem,
        items: _howItems
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            )
            .toList(),
        selectedItemBuilder: (context) => _howItems
            .map(
              (e) => Text(
                e,
                style: const TextStyle(fontSize: 18.0),
              ),
            )
            .toList(),
        hint: const Text('How', style: TextStyle(color: Colors.grey)),
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: Container(),
        onChanged: (value) {
          setState(() {
            howItem = value;
          });
        },
      ),
    );
  }

  Widget buildDatePicker(double screenWidth) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 2.0, color: Color(0xffC5C5C5)),
      ),
      width: screenWidth * 0.72,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2035),
          );
          if (newDate != null) {
            setState(() {
              date = newDate;
            });
          }
        },
        child: Text(
          'Date: ${date.year} / ${date.month} / ${date.day}',
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
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
          buildExplainTextField(),
          const SizedBox(height: 30.0),
          buildAmountTextField(),
          const SizedBox(height: 30.0),
          buildHowSelect(screenWidth),
          const SizedBox(height: 30.0),
          buildDatePicker(screenWidth),
          const Spacer(),
          GestureDetector(
            onTap: () {
              var newData = ExpenseData(
                IN: selectedItem!,
                amount: amount_c.text,
                dateTime: date,
                explain: explain_C.text,
                name: selectedItem!,
              );
              box.add(newData);
              Navigator.of(context).pop();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xff368983),
              ),
              width: screenWidth * 0.24,
              height: 50.0,
              child: const Text(
                'Save',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
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
