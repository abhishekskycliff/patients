import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctorapp/Model/userclass.dart';
import 'package:doctorapp/Screens/drawer.dart';
import 'package:doctorapp/Screens/futerbuilder.dart';
import 'package:doctorapp/service/service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DoctorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoctorState();
  }
}

class DoctorState extends State<DoctorScreen> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          title: ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/ec/d0/e9/ecd0e9824d7243ba760b9b171fab728e.png'),
              ),
            ),
            title: Text('Dr. Scilaris',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          actions: [
            PopupMenuButton<int>(
              icon: Icon(Icons.more_vert),
              offset: Offset(0, 60),
              // currentIndex: _selectedIndex,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text(
                    "My Appointment",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Patients Details",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text(
                    "My account",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: 1000,
                  height: 30,
                  color: Colors.blue,
                ),
                FractionalTranslation(
                  translation: Offset(0, -0.5),
                  child: Align(
                    child: Card(
                      child: Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Search patients',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search)),
                        ),
                        height: 50,
                        width: 300,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // color: Colors.green,
            //margin: const EdgeInsets.only(top: 20),
          ),
          Container(
            child: DatePicker(
              DateTime.now(),
              width: 60,
              height: 80,
              controller: _controller,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              // inactiveDates: [
              //   DateTime.now().add(Duration(days: 2)),
              //   DateTime.now().add(Duration(days: 4)),
              //   DateTime.now().add(Duration(days: 7))
              // ],
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ),
          Container(
            width: 100,
            height: 500,
            decoration: BoxDecoration(
              color: HexColor('#FBE4D2'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
              ),
            ),
            margin: const EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                Container(
                  child: Text(
                    "HEASC - 54 DEAN(4)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 20),
                ),
                Futerbuilder(),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer_Screen(),
      floatingActionButton: FloatingActionButton(
        //  onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
