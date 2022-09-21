import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:meworld/core/models/rapydwallet.dart';
import 'package:meworld/core/models/transcatios_model.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';

import 'hive_helper.dart';

class RapydAPI {
  createWallet(Map<String, String> data) async {
    var walletBody = {
      'first_name': data['first_name'],
      'last_name': data["last_name"],
      'type': data['type']
    };
    try {
      var fakeContacts = sl<Database>().generateFakeData();
      var response = await sl<FirebaseFunctions>()
          .httpsCallable('createWallet')
          .call({'body': walletBody});
      var newWallet = Wallet.fromMap(response.data["data"]);
      //save to firebase
      await sl<FirebaseFirestore>()
          .doc('Users/${data['userid']}')
          .update({'walletID': newWallet.id});
      // add contacts
      await sl<FirebaseFirestore>().doc('Users/${data['userid']}').update({
        'contacts': [...fakeContacts.map((e) => e.toJson()).toList()]
      });
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

    var loadUser = await sl<Database>().getUser();

    print(response);
    if (response.data != null) {
      var list = response.data as List;
      return List.generate(
        list.length,
        (index) => WalletBalanceModel.fromMap(
          list[index]['data'],
        ),
      );
    } else {
      return [];
    }
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
    var itemsList = (list.data as List);

    return List.generate(itemsList.length,
        (index) => WalletTransactionModel.fromMap(itemsList[index]));
  }

  sendMoney({
    required String amount,
    required String receiver,
    required String sender,
    required String currency,
    required void Function() error,
    required void Function() success,
  }) async {
    try {
      var response = await sl<FirebaseFunctions>()
          .httpsCallable('walletTransferRequest')
          .call({
        'body': {
          'amount': amount,
          'currency': currency,
          'destination_ewallet': receiver,
          'source_ewallet': sender
        }
      });

      if (response.data['status']['status'] == 'SUCCESS') {
        // set status to acepted
        var responded = await sl<FirebaseFunctions>()
            .httpsCallable('setTransferResponse')
            .call({
          'body': {'id': response.data['data']['id'], 'status': 'accept'}
        });
        if (responded.data['status']['status'] == 'SUCCESS') {
          success();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      error();
    }
  }
}
