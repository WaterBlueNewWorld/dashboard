import 'package:dashboard/data_sources/bh_controller.dart';
import 'package:dashboard/data_sources/dispositivos_data_source.dart';
import 'package:dashboard/routes/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DemoDashboard());
}

class DemoDashboard extends StatelessWidget {
  DemoDashboard({super.key});
  final DispositivosDataSource _dispositivosDataSource = DispositivosDataSource();

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
          return Portal(child: Dashboard(dispositivosDataSource: _dispositivosDataSource,));
        } ,
      ),
    );
  }
}
