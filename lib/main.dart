import 'package:binding_prueba/routes/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DemoDashboard());
}

class DemoDashboard extends StatelessWidget {
  const DemoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Dashboard(),
    );
  }
}
