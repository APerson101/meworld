import 'package:hive_flutter/hive_flutter.dart';
import 'package:meworld/core/models/rapydwallet.dart';

class HiveHelper {
  // var walletBox = Hive.box('wallet');
  Box<Wallet>? walletBox;
  HiveHelper() {
    init();
  }
  Wallet? activeWallet;
  init() async {
    Hive.registerAdapter(WalletAdapter());
    walletBox = await Hive.openBox('walletBox');
  }

  addWalletToBox(Wallet wallet) {
    walletBox!.put('wallet', wallet);
  }

  Wallet? getWalletFromBox() {
    activeWallet == null
        ? activeWallet = walletBox!.get('wallet') as Wallet
        : null;
    return activeWallet;
  }
}
