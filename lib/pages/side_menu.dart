import 'package:flutter/material.dart';
import 'package:myapp/components/buttom_nav_bar.dart';
import 'package:myapp/pages/history_fix.dart';
import 'package:myapp/pages/showStatus.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
              child: Text(
                'Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              )),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History Fix'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HistoryFix()))
            },
          ),
          ListTile(
            leading: Icon(Icons.work_history),
            title: Text('Status Fix'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ShowStatus()))
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Back'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => buttomBar()))
            },
          ),
        ],
      ),
    );
  }
}
