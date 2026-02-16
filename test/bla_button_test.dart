
import 'package:blaapp/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:blaapp/ui/widgets/actions/bla_button.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: test()),
    );
  }
}

class test extends StatefulWidget {


  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Primary Enabled
        Text("Primary Enabled", style: BlaTextStyles.heading),
        const SizedBox(height: BlaSpacings.m),
        BlaButton(
          label: "Primary Enabled",
          leadingIcon: Icons.check,
          primary: true,
          isEnabled: true,
          onTap: () {},
        ),
        const SizedBox(height: BlaSpacings.l),

        // Primary Disabled
        Text("Primary Disabled", style: BlaTextStyles.heading),
        const SizedBox(height: BlaSpacings.m),
        BlaButton(
          label: "Primary Disabled",
          leadingIcon: Icons.block,
          primary: true,
          isEnabled: false,
          onTap: () {},
        ),
        const SizedBox(height: BlaSpacings.l),

        // Secondary Enabled
        Text("Secondary Enabled", style: BlaTextStyles.heading),
        const SizedBox(height: BlaSpacings.m),
        BlaButton(
          label: "Secondary Enabled",
          leadingIcon: Icons.info,
          primary: false,
          isEnabled: true,
          onTap: () {},
        ),
        const SizedBox(height: BlaSpacings.l),

        // Secondary Disabled
        Text("Secondary Disabled", style: BlaTextStyles.heading),
        const SizedBox(height: BlaSpacings.m),
        BlaButton(
          label: "Secondary Disabled",
          leadingIcon: null,
          primary: false,
          isEnabled: false,
          onTap: () {},
        ),
      ],
    );
  }
}
