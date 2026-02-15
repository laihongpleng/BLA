import 'package:flutter/material.dart';
import 'package:blaapp/ui/widgets/actions/bla_button.dart';
import 'package:blaapp/ui/widgets/display/bla_divider.dart';
import 'package:intl/intl.dart';
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

  }
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
          onPressed: (){},
        ),
        const BlaDivider(),

        RidePrefInput(
          title: arrival?.name ?? "Select arrival",
          icon: Icons.location_on,
          onPressed: (){},
        ),
        const BlaDivider(),

        RidePrefInput(
          title: DateFormat('yyyy-MM-dd').format(departureDate),

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
          onTap: () {},
        ),
      ],
    );
  }
}
