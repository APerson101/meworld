import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/models/bookingsmodel.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/core/repository/bookings_manager.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';

class AvailableLocationsView extends ConsumerWidget {
  const AvailableLocationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(_availableLocations(RangedTime(
            startTime: DateTime.now(),
            endTime: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day + 2))))
        .when(
            data: (locations) {
              return _LocationsView(locations: locations);
            },
            error: (ob, st) {
              debugPrintStack(stackTrace: st);
              return const Center(child: Text("Failed to load"));
            },
            loading: () => const CircularProgressIndicator.adaptive());
  }
}

class _LocationsView extends ConsumerWidget {
  const _LocationsView({Key? key, required this.locations}) : super(key: key);
  final List<BusinessAccountModel> locations;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return locations.isEmpty
        ? const Material(
            child: Text(
                "No available locations on selected dates, try another date"),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                ...locations
                    .map((location) => ListTile(
                          onTap: () {
                            //go to details, user
                            GoRouter.of(context).push('/Sports');
                          },
                          title: Text(location.name),
                          subtitle: const Text("show estimated price here"),
                          trailing: ElevatedButton(
                              onPressed: () async {
                                await sl<BookingManager>().makeBooking(
                                    booking: BookingsModel(
                                        businessID: location.businessID,
                                        userID: 'userID',
                                        time: [],
                                        bookingStatus:
                                            BookingStatus.awaitingConfirmation,
                                        bookingID: 'bookingIDqwr'),
                                    onError: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: ListTile(
                                        title: Text("FAILED"),
                                      )));
                                    },
                                    onSuccess: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: ListTile(
                                        title: Text("SUCCESS"),
                                      )));
                                    });
                              },
                              child: const Text("Book")),
                        ))
                    .toList()
              ],
            ),
          );
  }
}

final _availableLocations =
    FutureProvider.family<List<BusinessAccountModel>, RangedTime>(
        (ref, userSelectedTime) async {
  // get all locations
  // for each location:
  //        check if is booked within the specified dates
  List<BusinessAccountModel> allPossibleLocations =
      await sl<Database>().getBusinessByType(BusinessTypes.sportscenter);
  var bookings =
      await sl<BookingManager>().getBookingsOfType(BusinessTypes.sportscenter);
  // check if it is booked:
  // 1: get all bookings where this is the location
  for (var booking in bookings) {
    for (var element in booking.time) {
      bool isAfter = element.startTime.isAfter(userSelectedTime.startTime);
      bool sameTime =
          element.startTime.isAtSameMomentAs(userSelectedTime.startTime);
      if ((isAfter || sameTime) &&
          element.startTime.isBefore(userSelectedTime.endTime)) {
        //clash, dont add
        allPossibleLocations
            .removeWhere((bus) => bus.businessID == booking.businessID);
      }
    }
  }

  return allPossibleLocations;
});
