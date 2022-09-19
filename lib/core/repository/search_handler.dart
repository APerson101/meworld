import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meworld/core/models/business_account_model.dart';

class SearchManager {
  FirebaseAuth auth;
  FirebaseFirestore store;
  SearchManager({
    required this.auth,
    required this.store,
  });

  searchName(String text) async {
    List all = [];
    var allDocsWithSameName = await store
        .collection('Business Accounts')
        .where('name', isEqualTo: text)
        .get();
    for (var element in allDocsWithSameName.docs) {
      all.add(BusinessAccountModel.fromJson(element.data()));
    }
    return all;
  }

  searchType(String text) async {
    List all = [];

    var allDocsWithSametype = await store
        .collection('Business Accounts')
        .where('type', isEqualTo: text)
        .get();
    for (var element in allDocsWithSametype.docs) {
      all.add(BusinessAccountModel.fromJson(element.data()));
    }
    return all;
  }
}
