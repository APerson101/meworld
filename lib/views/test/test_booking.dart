import 'package:flutter/material.dart';
import 'package:meworld/core/models/bookingsmodel.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/core/models/sportsfacilitymodel.dart';
import 'package:meworld/core/repository/bookings_manager.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/account_sign_up.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';
import 'package:meworld/views/screens/business%20forms/sports_center_form_view.dart';

class TestWidgetBookings extends StatelessWidget {
  TestWidgetBookings({Key? key}) : super(key: key);
  final database = sl<Database>();
  final booker = sl<BookingManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () async {
                var business = BusinessAccountModel(
                    type: BusinessTypes.consultant,
                    availability: [
                      BusinessDayAvailabilityModel(
                          day: DaysOfWeek.friday,
                          times: [
                            RangedTime(
                                startTime: DateTime.now(),
                                endTime: DateTime.now())
                          ])
                    ],
                    name: 'name',
                    description: ' description',
                    location: const BusinessLocationModel(
                        longitude: 543, latitude: 34, location: 'location'),
                    moreInfo: 'moreInfo',
                    imageurls: ['imageurls'],
                    vidoeurls: ['vidoeurls'],
                    businessID: 'businessID');
                await sl<Database>().createBusinessAccount(
                    businessAccount: business,
                    error: () {
                      ScaffoldMessenger.of(context).showSnackBar(error());
                    });
              },
              child: const Text("Create health consultant")),
          ElevatedButton(
              onPressed: () async {
                await sl<BookingManager>().makeBooking(
                    booking: BookingsModel(
                        businessID: 'businessID',
                        userID: 'userID',
                        time: [
                          RangedTime(
                              startTime: DateTime.now(),
                              endTime: DateTime.now())
                        ],
                        bookingStatus: BookingStatus.awaitingConfirmation,
                        bookingID: 'bookingID'),
                    onError: error,
                    onSuccess: success);
              },
              child: const Text("book health")),
          ElevatedButton(
              onPressed: () async {
                await sl<BookingManager>()
                    .cancelBooking('bookingID', success, error);
              },
              child: const Text("Cancel health booking")),
          ElevatedButton(
              onPressed: () async {
                await sl<BookingManager>()
                    .confirmBooking('bookingID', success, error);
              },
              child: const Text("Confirm health booking")),
          ElevatedButton(
              onPressed: () async {
                await sl<BookingManager>()
                    .getAllConsultantBookings('businessID');
              },
              child: const Text("view all consultant")),
          ElevatedButton(
              onPressed: () async {
                await sl<BookingManager>().getAllUserBookings('userID');
              },
              child: const Text("View all user boookings")),
          ElevatedButton(
              onPressed: () async {
                await database.createBusinessAccount(
                    businessAccount: BusinessAccountModel(
                        type: BusinessTypes.sportscenter,
                        availability: [
                          BusinessDayAvailabilityModel(
                              day: DaysOfWeek.monday,
                              times: [
                                RangedTime(
                                    startTime: DateTime.now(),
                                    endTime: DateTime.now())
                              ]),
                          BusinessDayAvailabilityModel(
                              day: DaysOfWeek.monday,
                              times: [
                                RangedTime(
                                    startTime: DateTime.now(),
                                    endTime: DateTime.now())
                              ])
                        ],
                        name: "name",
                        description: 'description',
                        location: const BusinessLocationModel(
                            longitude: 343,
                            latitude: 43243,
                            location: 'location'),
                        moreInfo: 'moreInfo',
                        imageurls: ['re'],
                        vidoeurls: ['fsd'],
                        businessID: 'sportsCenterID',
                        sportsFacilities: List.generate(
                            2,
                            (index) => SportsFacilityModel(
                                name: 'name',
                                price: 43,
                                paymentType: SportsPaymentOptions.perHr))),
                    error: () =>
                        ScaffoldMessenger.of(context).showSnackBar(error()));
              },
              child: const Text("Create sports center")),
          ElevatedButton(
              onPressed: () async {
                booker.makeBooking(
                    booking: BookingsModel(
                        sportsFacility: SportsFacilities.cricket,
                        businessID: 'sportsCenterID',
                        userID: 'userID',
                        time: List.generate(
                            2,
                            (index) => RangedTime(
                                startTime: DateTime.now(),
                                endTime: DateTime.now())),
                        bookingStatus: BookingStatus.awaitingConfirmation,
                        bookingID: 'bookingID2'),
                    onError: () {},
                    onSuccess: () {});
              },
              child: const Text("book sports center"))
        ],
      ),
    );
  }

  error() {
    return const SnackBar(
        content: ListTile(
      title: Text("Faild to work"),
    ));
  }

  success() {
    return const SnackBar(
        content: ListTile(
      title: Text("Successful"),
    ));
  }
}
