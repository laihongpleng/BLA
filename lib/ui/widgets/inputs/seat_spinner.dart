import 'package:flutter/material.dart';
import '../../theme/theme.dart';
class SeatsPickerPage extends StatefulWidget {
  final int initialSeats;

  const SeatsPickerPage({super.key, required this.initialSeats});

  @override
  State<SeatsPickerPage> createState() => _SeatsPickerPageState();
}

class _SeatsPickerPageState extends State<SeatsPickerPage> {
  late int seats;

  @override
  void initState() {
    super.initState();
    seats = widget.initialSeats;
  }

  void increment() => setState(() => seats++);
  void decrement() => setState(() {
    if (seats > 1) seats--;
  });

  void confirm() {
    Navigator.pop(context, seats);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select number of Seats")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Seats: $seats", style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BlaColors.primary,
                  ),
                  child: Text(
                  "-", 
                  style: BlaTextStyles.button.copyWith(color: BlaColors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                onPressed: increment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: BlaColors.primary,
                ), child: Text(
                    "+",
                    style: BlaTextStyles.button.copyWith(
                      color: BlaColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: confirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: BlaColors.primary,
              ), child: Text(
                    "Comfirm",
                    style: BlaTextStyles.button.copyWith(
                      color: BlaColors.white,
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
