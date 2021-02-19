import 'package:flutter/material.dart';

class AppbarWidget {

  void _itemselected(int selectedindex) {
    print(selectedindex);
  }

  static getAppBar(String title) {
    return PreferredSize(
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
           // onSelected: _itemselected,
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
    );
  }
}
