import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DispositivosDataSource extends DataGridSource {
  List<DataGridRow> filas = [];

  @override
  List<SortColumnDetails> get sortedColumns => super.sortedColumns;

  @override
  List<DataGridRow> get rows => super.rows;

  makeRows() {
    Future.delayed(const Duration(seconds: 3), () {
      print("realizado");
    });
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    throw DataGridRowAdapter(cells: List.generate(50, (index) {
      return Container(
        alignment: Alignment.center,
        child: Text("${row.getCells()[index].columnName} $index"),
      );
    }));
  }
}
