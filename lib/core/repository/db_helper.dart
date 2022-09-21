import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/core/models/user_account_model.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';

class Database {
  late FirebaseFirestore store;
  UserAccountModel? activeUser;
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

  List<ContactsModel> generateFakeData() {
    List<ContactsModel> fakeContacts = [];

    List<String> data = [
      'ewallet_2a380f094ab9dc95853c7a2810d463be',
      'ewallet_2beb730cbcaf664183db7893c71ed1c2',
      'ewallet_14b3f35cf496841a0d14530b20a8a436',
      'ewallet_8915a683d289e4b1fe20c514a58b5b81',
      'ewallet_886129649137889566d1c584215bc5c7',
      'ewallet_4f8107aa55b12c5833a79bd98c3645a4',
      'ewallet_3b61f3942fe6a8708ece9b8e26be7682',
      'ewallet_0af54b8a4d18d2f9f69552a6c469a285',
      'ewallet_5a8b92249fbb62f30cb905ede532048b',
      'ewallet_d6ac7315450eeac89371429018e8cadc'
    ];
    for (var i = 0; i < 10; i++) {
      fakeContacts.add(ContactsModel(name: 'John Frank', eWalletID: data[i]));
    }
    return fakeContacts;
    // await store.collection('Contacts').add({
    //   'contacts': [...fakeContacts.map((e) => e.toJson()).toList()]
    // });
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

  getUser() async {
    var user = sl.get<FirebaseAuth>().currentUser;
    assert(user != null);
    String id = user!.uid;
    var userModel = await store.doc('Users/$id').get();
    activeUser = UserAccountModel.fromJson(userModel.data() ?? {});
  }

  createRapydWallet(BusinessAccountModel account) async {}
}
