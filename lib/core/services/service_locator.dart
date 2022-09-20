import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meworld/core/repository/authentication_repo.dart';
import 'package:meworld/core/repository/bookings_manager.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/repository/hive_helper.dart';
import 'package:meworld/core/repository/rapyd_helper.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<FirebaseFirestore>(
      // var instance = FirebaseFirestore.instance;
      // instance.useFirestoreEmulator('localhost', 8080);
      // return instance;
      FirebaseFirestore.instance..useFirestoreEmulator('localhost', 8080));
  sl.registerSingleton<FirebaseAuth>(
      // var instance =
      FirebaseAuth.instance..useAuthEmulator('localhost', 9099)
      // return instance;
      );
  sl.registerSingleton<FirebaseFunctions>(
      FirebaseFunctions.instance..useFunctionsEmulator('localhost', 5001));
  sl.registerFactory<AuthenticationRepo>(() => AuthenticationRepo());
  sl.registerSingleton<Database>(Database(store: sl.get<FirebaseFirestore>()));
  sl.registerSingleton<HiveHelper>(HiveHelper());
  sl.registerSingleton<RapydAPI>(RapydAPI());
  sl.registerSingleton<BookingManager>(BookingManager(
      store: sl.get<FirebaseFirestore>(), auth: sl.get<FirebaseAuth>()));
}
