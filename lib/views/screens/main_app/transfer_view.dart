import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';

class TransferView extends ConsumerWidget {
  const TransferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeUser = sl<Database>().activeUser;
    return SizedBox(
      height: 200,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () async {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) {
                        assert(activeUser != null);
                        return activeUser!.contacts == null
                            ? const Center(
                                child: Text("No contacts saved"),
                              )
                            : SizedBox(
                                height: 550,
                                child: ListView(
                                  children: [
                                    ...activeUser.contacts!.map((contact) {
                                      return Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: ListTile(
                                            onTap: () {
                                              GoRouter.of(context).push(
                                                  '/amountpage',
                                                  extra: contact);
                                            },
                                            title: Text(contact.name),
                                            subtitle: Text(contact.eWalletID),
                                          ),
                                        ),
                                      );
                                    }).toList()
                                  ],
                                ),
                              );
                      },
                    );
                  },
                  icon: const Icon(Icons.person)),
              const Text("Send to Contact")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        var controller = TextEditingController();
                        return SizedBox(
                          height: 400,
                          child: Scaffold(
                            appBar: AppBar(),
                            body: SizedBox(
                                width: MediaQuery.of(context).size.width * .8,
                                height: 400,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: controller,
                                        decoration: InputDecoration(
                                            hintText: 'Enter wallet id',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    ElevatedButton(
                                        onPressed: () {
                                          //move to the page to enter amount to transfer
                                        },
                                        child: const Text("Continue"))
                                  ],
                                )),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.wallet),
              ),
              const Text("Send to wallet")
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () async {
                  if (!kIsWeb) {
                    await Permission.camera.isGranted == false
                        ? await Permission.camera.request()
                        : null;
                  } else {
                    var perm = await window.navigator.permissions!
                        .query({"name": 'camera'});
                    if (perm.state == 'deined') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Oops! Camera access denied!"),
                        backgroundColor: Colors.orangeAccent,
                      ));
                      return;
                    }
                  }
                  GoRouter.of(context).push('/qrcodepage');
                },
                icon: const Icon(Icons.qr_code),
              ),
              const Text("Scan QR code")
            ],
          )
        ],
      ),
    );
  }
}
