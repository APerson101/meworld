import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/models/user_account_model.dart';
import 'package:meworld/core/repository/hive_helper.dart';
import 'package:meworld/core/repository/rapyd_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/authentication/login_view.dart';

class TranferAmountView extends ConsumerWidget {
  const TranferAmountView({Key? key, this.contact}) : super(key: key);
  final ContactsModel? contact;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          const Positioned(
            child: ListTile(
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: BackButton(),
              ),
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Send Money",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: contact != null
                  ? _ReceiverView(contact: contact!)
                  : Container()),
          Positioned(
            top: 50,
            left: 0,
            // right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton<currencies>(
                  value: ref.watch(_currency),
                  items: [
                    ...currencies.values
                        .map((e) => DropdownMenuItem(
                            value: e, child: Text(describeEnum(e))))
                        .toList()
                  ],
                  onChanged: (selected) {
                    selected != null
                        ? ref.watch(_currency.notifier).state = selected
                        : null;
                  }),
            ),
          ),
          const Positioned(top: 150, left: 100, right: 0, child: _AmountView()),
          const Positioned(top: 200, child: _NumbersView()),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: StyledButton(
                onPressed: () async {
                  await sl<RapydAPI>().sendMoney(
                      sender: sl<HiveHelper>().activeWallet!.id,
                      success: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: ListTile(
                          title: Text("Transfer Successful"),
                        )));
                        Future.delayed(const Duration(seconds: 2), () {
                          GoRouter.of(context).pop();
                        });
                      },
                      error: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: ListTile(
                          title: Text("Failed to Send, Please try again later"),
                        )));
                      },
                      amount: ref.watch(_amount),
                      receiver: contact!.eWalletID,
                      currency: describeEnum(ref.watch(_currency)));
                },
                child: Text('Send  ${ref.watch(_amount)}')),
          )
        ],
      ),
    );
  }
}

final _currency = StateProvider((ref) => currencies.usd);
final _amount = StateProvider((ref) => '0.0');

enum currencies { usd, gbp, eur }

class _AmountView extends ConsumerWidget {
  const _AmountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              describeEnum(ref.watch(_currency)).toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),
          ),
          Text(
            ref.watch(_amount),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
          )
        ],
      ),
    );
  }
}

class _ReceiverView extends StatelessWidget {
  const _ReceiverView({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final ContactsModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.withOpacity(.4),
      leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/personicon.png')),
      title: Text(contact.name),
      subtitle: Text(contact.name),
    );
  }
}

class _NumbersView extends ConsumerWidget {
  const _NumbersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 7,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            ...List.generate(9, (index) {
              var activeColor = StateProvider<Color?>(
                  (ref) => Colors.purpleAccent.withOpacity(.6));
              return GestureDetector(
                  onTap: () {
                    var amount = ref.watch(_amount);
                    amount += (index + 1).toString();
                    ref.watch(_amount.notifier).state = amount;
                  },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: ref.watch(activeColor),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                              fontSize: 10,
                              color: ref.watch(activeColor) != null
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ));
            }),
            Builder(builder: (context) {
              var activeColor = StateProvider<Color?>(
                  (ref) => Colors.purpleAccent.withOpacity(.6));
              return GestureDetector(
                  onTap: () {
                    var amount = ref.watch(_amount);
                    amount += '.'.toString();
                    ref.watch(_amount.notifier).state = amount;
                  },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ref.watch(activeColor),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '.',
                              style: TextStyle(
                                  color: ref.watch(activeColor) != null
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                  ));
            }),
            Builder(builder: (context) {
              var tappedColor = Colors.purpleAccent.withOpacity(.7);
              return GestureDetector(
                  onTap: () {
                    var amount = ref.watch(_amount);
                    amount += '0'.toString();
                    ref.watch(_amount.notifier).state = amount;
                  },
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: tappedColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '0',
                                style: TextStyle(color: Colors.white),
                              )))));
            }),
            FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.backspace),
                  onPressed: () {
                    var ammount = ref.watch(_amount);
                    if (ammount.isEmpty) {
                      return;
                    } else {
                      var newAmount = ammount.substring(0, ammount.length - 1);
                      ref.watch(_amount.notifier).state = newAmount;
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
