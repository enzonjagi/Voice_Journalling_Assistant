// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);
}
