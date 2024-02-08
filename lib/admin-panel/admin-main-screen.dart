// // ignore_for_file: prefer_const_constructors, file_names
//
//
//
//
// import 'package:flutter/material.dart';
//
// class AdminMainScreen extends StatefulWidget {
//   const AdminMainScreen({super.key});
//
//   @override
//   State<AdminMainScreen> createState() => _AdminMainScreenState();
// }
//
// class _AdminMainScreenState extends State<AdminMainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome to Admin Panel"),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'add-product-screen.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Page 1'),
    Text('Page 2'),
    Text('Page 3'),
    Text('Page 4'),
    // Add more screens as needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Admin Panel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Page 1'),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              title: Text('Page 2'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              title: Text('Add Product'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductScreen()),
                );
              },
            ),

            ListTile(
              title: Text('Page 4'),
              selected: _selectedIndex == 3,
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Admin Panel Demo',
    home: AdminMainScreen(),
  ));
}
