import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/core/models/user_account_model.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';

class Database {
  late FirebaseFirestore store;
  Database({required this.store});
  Future<bool> accountExists() async {
    var user = sl.get<FirebaseAuth>().currentUser;
    print("checking if this user exists: ${user?.email} with id: ${user?.uid}");
    var userExists = user != null
        ? (await store.doc('Users/${user.uid}').get()).exists
        : false;
    var businessExists = user != null
        ? (await store
                    .collection('Business Accounts')
                    .where('businessID', isEqualTo: user.uid)
                    .get())
                .size ==
            1
        : false;
    if (userExists || businessExists) return true;
    return false;
  }

  createBusinessAccount(
      {required BusinessAccountModel businessAccount,
      required void Function() error}) async {
    try {
      debugPrint("saving business...");
      print(businessAccount.toJson());
      await store.collection('Business Accounts').add(businessAccount.toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      error();
      return false;
    }
  }

  Future<bool> createUserAccount(
      {required UserAccountModel account,
      required void Function() error}) async {
    try {
      await store.doc('Users/${account.userID}').set(account.toJson());
      return true;
    } catch (e) {
      error();
      return false;
    }
  }

  getBusiness(String id) async {
    var allDocsWithSameName = await store
        .collection('Business Accounts')
        .where('businessID', isEqualTo: id)
        .get();
    return BusinessAccountModel.fromJson(allDocsWithSameName.docs.first.data());
  }

  getBusinessByType(BusinessTypes type) async {
    var allDocsWithSameType = await store
        .collection('Business Accounts')
        .where('type', isEqualTo: describeEnum(type))
        .get();

    return List.generate(
        allDocsWithSameType.docs.length,
        (index) => BusinessAccountModel.fromJson(
            allDocsWithSameType.docs[index].data()));
  }

  createRapydWallet(BusinessAccountModel account) async {}
}
