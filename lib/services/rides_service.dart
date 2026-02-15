//C:\Users\DELL\Documents\Cadt\cadty3t2\Flutter\my_app\lib\services\rides_service.dart
import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(List<Ride> rides, Location departure) {
    return availableRides
        .where((ride) => ride.departureLocation == departure)
        .toList();
  }
 
 
  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(
    List<Ride> rides,
    int requestedSeat,
  ) {
    return rides.where((ride) => ride.remainingSeats >= requestedSeat).toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> filterRides = availableRides;
    if (departure != null) {
      filterRides = _filterByDeparture(filterRides, departure);
    }
    if (seatRequested != null) {
      filterRides = _filterBySeatRequested(filterRides, seatRequested);
    }
    return filterRides;
  }

  //
  static List<Ride> filterByDeparture(Location departure) {
    List<Ride> result = []; //because my class name Ride

    for (Ride ride in availableRides) {
      //Ride is type of object because availableRides contain Ride objects and only class name can use as types
      //for (Type variableName in list) availableRides because i defined it

      print("Checking ride from: ${ride.departureLocation}");

      if (ride.departureLocation == departure) {
        print("MATCH FOUND");
        result.add(ride);
      }
    }

    return result;
  }

  static List<Ride> _filterByArrival(List<Ride> rides, Location arrival) {
    return rides.where((ride) => ride.arrivalLocation == arrival).toList();
  }

  static List<Ride> _filterByArrivals(List<Ride> rides, Location arrival) {
    List<Ride> result = [];
    for (Ride ride in rides) {
      if (ride.arrivalLocation == arrival) {
        result.add(ride);
      }
    }
    return result;
  }

  static List<Ride> _filterByMaxPrice(List<Ride> rides, double maxPrice) {
    List<Ride> result = [];
    for (Ride ride in rides) {
      if (ride.pricePerSeat <= maxPrice) {
        result.add(ride);
      }
    }
    return result;
  }
  static List<Ride> filtersBy({
    Location? departure,
    Location? arrival,
    int? seatRequested,
    double? maxPrice,
  }) {
    List<Ride> filtered = availableRides;

    if (departure != null) {
      filtered = _filterByDeparture(filtered, departure);
    }

    if (arrival != null) {
      filtered = _filterByArrival(filtered, arrival);
    }

    if (seatRequested != null) {
      filtered = _filterBySeatRequested(filtered, seatRequested);
    }

    if (maxPrice != null) {
      filtered = _filterByMaxPrice(filtered, maxPrice);
    }

    return filtered;
  }




}
