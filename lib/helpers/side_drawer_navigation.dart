import 'package:ecom_app/screens/login_screen.dart';
import 'package:ecom_app/screens/order_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideDrawerNavigation extends StatefulWidget {
  @override
  _SideDrawerNavigationState createState() => _SideDrawerNavigationState();
}

class _SideDrawerNavigationState extends State<SideDrawerNavigation> {
  SharedPreferences _prefs;
  String _loginLogoutMenuText = "Log In";
  IconData _loginLogoutIcon = FontAwesomeIcons.signInAlt;

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
  }

  _isLoggedIn() async {
    _prefs = await SharedPreferences.getInstance();
    int userId = _prefs.getInt('userId');
    if (userId == 0) {
      setState(() {
        _loginLogoutMenuText = "Log In";
        _loginLogoutIcon = FontAwesomeIcons.signInAlt;
      });
    } else {
      setState(() {
        _loginLogoutMenuText = "Logout";
        _loginLogoutIcon = FontAwesomeIcons.signOutAlt;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Drawer(
        child: Container(
          color: Colors.redAccent,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.redAccent),
                accountName: Text('Lutfor Rahman'),
                accountEmail: Text('contact.lutforrahman@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/user.png'),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.home, color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderListScreen()));
                },
                child: ListTile(
                  title: Text(
                    'Order List',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: ListTile(
                    title: Text(
                      _loginLogoutMenuText,
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(
                      _loginLogoutIcon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
