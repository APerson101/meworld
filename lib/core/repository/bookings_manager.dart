import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meworld/core/models/bookingsmodel.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';

class BookingManager {
  late FirebaseAuth auth;
  late FirebaseFirestore store;

  BookingManager({required this.auth, required this.store});

  Future<bool> makeBooking(
      {required BookingsModel booking,
      required void Function() onError,
      required void Function() onSuccess}) async {
    try {
      await store
          .doc('Business Bookings/${booking.bookingID}')
          .set(booking.toMap());
      return true;
    } catch (e) {
      onError();
      return false;
    }
  }

  Future<List<BookingsModel>?>? getAllConsultantBookings(
      String consultantID) async {
    var result = await store
        .collection('Business Bookings')
        .where('businessID', isEqualTo: consultantID)
        .get();
    if (result.size > 0) {
      List<BookingsModel> allBookings = [];
      var bookingslist = result.docs;
      for (var booking in bookingslist) {
        allBookings.add(BookingsModel.fromMap(booking.data()));
      }
      for (var element in allBookings) {
        print(element.toString());
      }
      return allBookings;
    }
    return null;
  }

  cancelBooking(
      String bookingID, void Function() success, void Function() error) async {
    try {
      await store
          .doc('Business Bookings/$bookingID')
          .update({'bookingStatus': describeEnum(BookingStatus.canceled)});
      success();
    } catch (e) {
      debugPrint(e.toString());
      error();
    }
  }

  confirmBooking(
      String bookingID, void Function() success, void Function() error) async {
    try {
      await store
          .doc('Business Bookings/$bookingID')
          .update({'bookingStatus': describeEnum(BookingStatus.awaitingTime)});
      success();
    } catch (e) {
      debugPrint(e.toString());
      error();
    }
  }

  Future<List<BookingsModel>?>? getAllUserBookings(String userID) async {
    var result = await store
        .collection('Business Bookings')
        .where('userID', isEqualTo: userID)
        .get();
    if (result.size > 0) {
      List<BookingsModel> allBookings = [];
      var bookingslist = result.docs;
      for (var booking in bookingslist) {
        allBookings.add(BookingsModel.fromMap(booking.data()));
      }
      for (var element in allBookings) {
        print(element.toString());
      }

      return allBookings;
    }
    return null;
  }

  Future<List<BookingsModel>> getBookingsOfType(BusinessTypes type) async {
    var result = await store
        .collection('Business Bookings')
        .where('type', isEqualTo: describeEnum(type))
        .get();
    List<BookingsModel> all = [];
    for (var element in result.docs) {
      all.add(BookingsModel.fromMap(element.data()));
    }
    return all;
  }
}
