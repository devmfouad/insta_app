import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


String? id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id");
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("$id"),
      ),
    );
  }
}
