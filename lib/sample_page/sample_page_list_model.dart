// import 'package:chinese_app/sample_page_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class SamplePageListModel{
//   List<SamplePageModel> samples = [];
//
//   Future getSamples() async {
//     collection = await FirebaseFirestore.instance.collection('samples').get();
//     samples = collection.docs
//         .map((doc) => SamplePageModel(
//         doc['name'],doc['price']))
//         .toList();
//     this.samples = samples;//左辺はModel内の変数、右辺はfirebaseから値をとってきた変数
//     notifyListeners();
//   }
// }