import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thu_chi_ca_nhan/screens/login_screens.dart';
import 'package:thu_chi_ca_nhan/widgets/transactions_cards.dart';

import '../widgets/hero_card.dart';

// prefer_const_constructors
class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  var isLogoutLoader = false;
  logOut() async {
    setState(() {
      isLogoutLoader = true; // Cập nhật đúng trạng thái loading
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: ((context) => LoginView())),
    );
    setState(() {
      isLogoutLoader = false;
    });
  }

_dialoBuilder(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Text("data"),
      );
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
          onPressed: ((){
            _dialoBuilder(context);
          }),
        child: Icon(Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: isLogoutLoader
                ? CircularProgressIndicator()
                : Icon(Icons.exit_to_app),
            color: Colors.white,
            iconSize: 40,
          )
        ],
      ),
      body: Column(
        children: [
          HeroCard(),
          TransactionsCard(),
        ],
      ),
    );
  }
}


