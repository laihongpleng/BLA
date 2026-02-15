import 'package:blaapp/services/rides_service.dart';
import 'package:blaapp/utils/date_time_util.dart';
import 'package:flutter/material.dart';
import 'package:blaapp/ui/widgets/actions/bla_button.dart';
import 'package:blaapp/ui/widgets/display/bla_divider.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import 'ride_pref_input.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///


class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  Location? arrival;
  late DateTime departureDate;
  late int requestedSeats;

  @override
  void initState() {
    super.initState();

    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;

    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();

    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }
  // ----------------------------------
  // Handle events
  // ----------------------------------

  void onDeparturePressed() {
    // 1- Select a location
  }

  void onArrivalPressed() {
    // TODO-1 - Complete
  }

  void onDatePressed() {


  }

  void onSeatsPressed() {

  }

  void onSubmit() {
    bool canSearch = departure != null && arrival != null;

    if (!canSearch) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select both departure and arrival"),
        ),
      );
      return;
    }

    List filteredRides = RidesService.filterBy(
      departure: departure,
      seatRequested: requestedSeats,
    );

    print("Filtered Rides: ${filteredRides.length}");
  }

  String get dateLabel => DateTimeUtils.formatDateTime(departureDate);
  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RidePrefInput(
          title: departure?.name ?? "Select departure",
          icon: Icons.location_on,
          rightIcon: Icons.swap_vert,
          onPressed:(){},
        ),
        const BlaDivider(),

        RidePrefInput(
          title: arrival?.name ?? "Select arrival",
          icon: Icons.location_on,
          onPressed: (){},
        ),
        const BlaDivider(),

        RidePrefInput(
          // title: DateFormat('yyyy-MM-dd').format(departureDate),
          title: dateLabel,
          icon: Icons.calendar_month,
          onPressed: (){},
        ),
        const BlaDivider(),

        RidePrefInput(
          title: "Seats: $requestedSeats",
          icon: Icons.person,
          onPressed: (){},
        ),
        const SizedBox(height: 20),
        const BlaDivider(),

        BlaButton(
          label: "search",
          primary: true,
          leadingIcon: Icons.search,
          onTap: onSubmit,
        ),
      ],
    );
  }
}
