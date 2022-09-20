import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:meworld/core/models/rapydwallet.dart';
import 'package:meworld/core/models/transcatios_model.dart';
import 'package:meworld/core/services/service_locator.dart';

import 'hive_helper.dart';

class RapydAPI {
  String baseURL = 'https://sandboxapi.raphyd.net/v1';
  createWallet(Map<String, String> data) async {
    var walletBody = {
      'first_name': data['first_name'],
      'last_name': data["last_name"],
      'type': data['type']
    };
    try {
      var response = await sl<FirebaseFunctions>()
          .httpsCallable('createWallet')
          .call({'body': walletBody});
      var newWallet = Wallet.fromMap(response.data["data"]);
      //save to firebase
      await sl<FirebaseFirestore>()
          .doc('Users/${data['userid']}')
          .update({'walletID': newWallet.id});
      //add to box
      sl<HiveHelper>().addWalletToBox(newWallet);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return e;
    }
  }

  loadWalletBalance({required String id}) async {
    var response = await sl<FirebaseFunctions>()
        .httpsCallable('retrieveWalletBalances')
        .call({'eWalletID': id});

    var list = response.data as List;
    return List.generate(
      list.length,
      (index) => WalletBalanceModel.fromMap(
        list[index],
      ),
    );
  }

  fundWallet(
      {required String id,
      required String amount,
      required void Function() success,
      required void Function() failure}) async {
    try {
      var response =
          await sl<FirebaseFunctions>().httpsCallable('addFundsToWallet').call({
        'body': {'ewallet': id, 'amount': amount, 'currency': 'USD'}
      });

      String status = response.data['status']['status'];
      status == 'SUCCESS' ? success() : failure();
    } catch (e) {
      debugPrint(e.toString());
      failure();
    }
  }

  Future<List<WalletTransactionModel>> getWalletHistory() async {
    var list = await sl<FirebaseFunctions>()
        .httpsCallable('getAllTransactions')
        .call({"eWalletID": sl<HiveHelper>().getWalletFromBox()!.id});
    var itemsList = (list as List);

    return List.generate(itemsList.length,
        (index) => WalletTransactionModel.fromMap(itemsList[index]));
  }
}
