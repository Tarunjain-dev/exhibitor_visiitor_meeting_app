import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

/// users collection in fireStore DB.
final usersCollection = FirebaseFirestore.instance.collection('users');
final usersSnapshots = FirebaseFirestore.instance.collection('users').snapshots();
CollectionReference usersRef = FirebaseFirestore.instance.collection('users');