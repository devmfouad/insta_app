import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? userId;


SharedPreferences? prefs;

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


String usersCollection = "users";
String postsCollection = "posts";

