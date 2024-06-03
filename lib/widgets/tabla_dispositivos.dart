import 'package:dashboard/data_sources/dispositivos_data_source.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TablaDispositivos extends StatefulWidget {
  const TablaDispositivos({super.key});

  @override
  State<TablaDispositivos> createState() => _TablaDispositivosState();
}

class _TablaDispositivosState extends State<TablaDispositivos> {
  final DispositivosDataSource source = DispositivosDataSource();

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: source,
      columns: const [],
    );
  }
}
