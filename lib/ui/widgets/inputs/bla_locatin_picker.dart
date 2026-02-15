import 'package:flutter/material.dart';
import 'package:blaapp/dummy_data/dummy_data.dart';
import '../../../model/ride/locations.dart';
import '../../widgets/display/bla_divider.dart';

class LocationPicker extends StatefulWidget {
  final Location? selectedLocation;

  const LocationPicker({super.key, this.selectedLocation});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late TextEditingController searchController;
  List<Location> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    filteredLocations = [];
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterLocations(String query) {
    setState(() {
      filteredLocations = [];
      if (query.isNotEmpty) {
        fakeLocations.forEach((location) {
          if (location.name.toLowerCase().contains(query.toLowerCase())) {
            filteredLocations.add(location);
          }
        });
      }
    });
  }

  void selectLocation(Location location) {
    Navigator.pop(context, location);
  }

  void clearSearch() {
    searchController.clear();
    filterLocations('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Location")),
      body: Column(
        children: [
          LocationSearchBar(
            controller: searchController,
            onChanged: filterLocations,
            onClear: clearSearch,
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.separated(
              itemCount: filteredLocations.length,
              separatorBuilder: (_, __) => const BlaDivider(),
              itemBuilder: (context, index) {
                final location = filteredLocations[index];

                return LocationTile(
                  location: location,
                  isSelected: widget.selectedLocation == location,
                  onTap: selectLocation,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LocationSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const LocationSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: const InputDecoration(
                  hintText: "Search city...",
                  border: InputBorder.none,
                ),
              ),
            ),

            if (controller.text.isNotEmpty)
              IconButton(icon: const Icon(Icons.close), onPressed: onClear),
          ],
        ),
      ),
    );
  }
}

class LocationTile extends StatelessWidget {
  final Location location;
  final bool isSelected;
  final ValueChanged<Location> onTap;

  const LocationTile({
    super.key,
    required this.location,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on),

      title: Text(location.name),
      subtitle: Text(location.country.name),

      trailing: isSelected
          ? const Icon(Icons.history)
          : const Icon(Icons.chevron_right),

      onTap: () => onTap(location),
    );
  }
}
