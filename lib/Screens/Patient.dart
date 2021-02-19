
import 'package:doctorapp/Screens/popup.dart';
import 'package:doctorapp/Widgets/flatbutton.dart';
import 'package:doctorapp/Widgets/tablelist.dart';
import 'package:doctorapp/Widgets/widgets.dart';
import 'package:doctorapp/values/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PatientsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PatientState();
  }
}



class PatientState extends State<PatientsScreen> {
  bool isSwitched = false;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      var _image = image;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      var _image = picture;
    });
  }


  /// when a mic is clicked it calls the void method _miconpressed
  void _miconpress() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Card(
            child: PopUp(),
          );
        });
  }

  /// When a camera is clicked it popup the items
  void _cammeraonpressed() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text(Strings.option),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text(Strings.camera),
              onPressed: openCamera,
            ),
            CupertinoActionSheetAction(
              child: const Text(Strings.lib),
              onPressed:openGallery,
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(Strings.cancel),
            isDefaultAction: true,
            onPressed: (){},
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appBar
      appBar: AppBar(
        title: Text(Strings.patient_name),
      ),
      body: ListView(
        children: [
          Container(
            child: Row(
              children: [
                /// Container for CircleAvatar
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(left: 50),
                  // color: Colors.green,
                  child: CircleAvatar(
                    child: Image.network(Strings.image),
                  ),
                ),

                /// Container for USer Detail's
                Container(
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      Text(
                        Strings.patient_name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        Strings.patient_date,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        Strings.patient_pc,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        Strings.patient_gender,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        Strings.patient_task,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 30, top: 50, bottom: 30),
                ),
                // ListTile(
                //   title: Text("hello"),
                // ),
              ],
            ),
            // color: Colors.green,
            height: 200,
          ),

          ///Container for switch button
          Container(
            //  color: Colors.amber,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    'Start File',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.blue,
                  inactiveThumbColor: Colors.grey,
                ),
              ],
            ),
          ),

          /// Container for mic and camera
          Container(
            // color: Colors.black,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flatbutton(
                  button: _miconpress,
                  icon: Icons.mic,
                ),
                Flatbutton(
                    button: _cammeraonpressed, icon: Icons.camera_alt_outlined),
              ],
            ),
          ),

          ///Patient detail box
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                TableList(
                    text1: Strings.datebirth, text2: Strings.patient_date),
                TableList(text1: Strings.caseno, text2: Strings.code),
                TableList(text1: Strings.patient_pc, text2: Strings.out),
              ],
            ),
            margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
            padding: const EdgeInsets.all(10),
          ),

          /// Three list in the bottom
          ContainerWidget(
            icon: Icons.camera_alt,
            textvalue: Strings.patient,
          ),
          ContainerWidget(
            icon: Icons.create_new_folder_sharp,
            textvalue: Strings.sup,
          ),
          ContainerWidget(
            icon: Icons.pending_actions,
            textvalue: Strings.hospital,
          ),
        ],
      ),
    );
  }
}

