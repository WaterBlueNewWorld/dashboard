import 'package:binding_prueba/data_sources/bh_controller.dart';
import 'package:binding_prueba/routes/dashboard.dart';
import 'package:binding_prueba/utils/tabla_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DemoDashboard());
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BDHProvider()),
        ],
        builder: (c, f) {
          return const Portal(child: Dashboard());
        } ,
      ),
    );
  }
}
