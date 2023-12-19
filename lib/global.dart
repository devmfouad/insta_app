import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? userId;


SharedPreferences? prefs;

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
ImagePicker imagePicker = ImagePicker();
FirebaseStorage storage  = FirebaseStorage.instance;



String usersCollection = "users";
String postsCollection = "posts";

