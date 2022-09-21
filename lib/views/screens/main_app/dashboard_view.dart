import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/models/rapydwallet.dart';
import 'package:meworld/core/repository/hive_helper.dart';
import 'package:meworld/core/repository/rapyd_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'transfer_view.dart';

final currentPage = StateProvider((ref) => 0);

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var wallet = ref.watch(loadWallet);
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(
        0.4,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text('Welcome, '),
                    Text('John Francis'),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.chat_outlined))
              ],
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.only(top: 30, bottom: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Wallet Balance: '),
                        ref.watch(loadWalletBalanceProvider(wallet.id)).when(
                            data: (balance) {
                              return balance.isNotEmpty
                                  ? Text(
                                      '${balance[0].currency} ${balance[0].balance} ')
                                  : const Text("USD 0");
                            },
                            error: (error, st) {
                              debugPrintStack(stackTrace: st);
                              return const Text("error");
                            },
                            loading: () =>
                                const CircularProgressIndicator.adaptive())
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WalletBalanceWidgets(
                            icon: Icons.add,
                            onTap: () {
                              // fund wallet;
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ShowCreditCardForm();
                              }));
                            },
                            title: 'ADD',
                          ),
                          WalletBalanceWidgets(
                            icon: Icons.send,
                            title: 'TRANSFER',
                            onTap: () {
                              //
                              showMaterialModalBottomSheet(
                                  context: context,
                                  builder: ((context) => const TransferView()));
                            },
                          ),
                          WalletBalanceWidgets(
                            icon: Icons.history,
                            onTap: () async {
                              GoRouter.of(context).push('/walletTxns');
                            },
                            title: 'HISTORY',
                          ),
                          WalletBalanceWidgets(
                            icon: Icons.monetization_on,
                            onTap: () {},
                            title: 'LOAN',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                DashBoardCards(
                  title: 'Artisans',
                  icon: Icons.settings,
                  onPressed: () {
                    GoRouter.of(context).push('/artisanCategory');
                  },
                ),
                const DashBoardCards(
                    title: 'Health', icon: Icons.health_and_safety),
                DashBoardCards(
                  title: 'Sports',
                  icon: Icons.sports_baseball_rounded,
                  onPressed: () => GoRouter.of(context).push('/Sports'),
                ),
                const DashBoardCards(
                    title: 'Freelancer', icon: Icons.engineering),
                const DashBoardCards(
                  title: 'Logistics',
                  icon: Icons.car_rental,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class WalletBalanceWidgets extends StatelessWidget {
  const WalletBalanceWidgets({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 55,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}

class DashBoardCards extends StatelessWidget {
  const DashBoardCards(
      {Key? key, required this.title, required this.icon, this.onPressed})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: size.height / 6,
        width: size.width / 2.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), Text(title)]),
      ),
    );
  }
}

final loadWalletBalanceProvider =
    FutureProvider.family<List<WalletBalanceModel>, String>((ref, id) async {
  log('getting balance for id: $id');
  return await sl<RapydAPI>().loadWalletBalance(id: id);
});

final loadWallet = StateProvider((ref) {
  log('loading wallet....');
  Wallet wallet = sl<HiveHelper>().getWalletFromBox()!;
  return wallet;
});

class ShowCreditCardForm extends StatefulWidget {
  const ShowCreditCardForm({Key? key}) : super(key: key);

  @override
  State<ShowCreditCardForm> createState() => _ShowCreditCardFormState();
}

class _ShowCreditCardFormState extends State<ShowCreditCardForm> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'Axis Bank',
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.red,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/images/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.white,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Card Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: useBackgroundImage,
                          inactiveTrackColor: Colors.grey,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          onChanged: (bool value) => setState(() {
                            useBackgroundImage = value;
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: const Text(
                          'Fund Wallet',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await sl<RapydAPI>().fundWallet(
                              id: sl<HiveHelper>().getWalletFromBox()!.id,
                              amount: '400',
                              failure: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: ListTile(
                                  title: Text(
                                      "Failed to fund wallet, please try again"),
                                )));
                              },
                              success: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: ListTile(
                                            title: Text(
                                                "Successfully funded Wallet"))));
                                Future.delayed(const Duration(seconds: 3), () {
                                  GoRouter.of(context).pop();
                                });
                              });
                          debugPrint('valid!');
                        } else {
                          debugPrint('invalid!');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
