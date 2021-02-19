import 'package:doctorapp/Screens/Patient.dart';
import 'package:flutter/material.dart';



class Drawer_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Profile_Screen();
  }
}

class Profile_Screen extends State<Drawer_Screen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName:Text('Dr. Silaris'),
              accountEmail: Text('s@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).platform == TargetPlatform.android
                    ?Colors.blueAccent : Colors.white,
                child: Text('S',
                  style: TextStyle(
                    fontSize: 50,
                  ),),

              ),
            ),

            ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("My account"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientsScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.pending_actions),
              title: Text('Patients List'),
            ),
            ListTile(
              leading: Icon(Icons.done),
              title: Text('Today Appointment'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),

            ),
          ],
        ),
      );
  }

}