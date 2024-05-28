import 'package:binding_prueba/models/dispositivo_model/dispositivo.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DispositivosDataSource extends DataGridSource {
  final Faker faker = Faker(seed: 453233);
  List<DataGridRow> filas = [];
  List<Dispositivo> listaDispositivos = [];
  Map<String, dynamic> datos = {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
  };

  DispositivosDataSource() {
    listaDispositivos = List.generate(20, (index) {
      return Dispositivo(
        nombre: faker.person.firstName(),
        etiqueta: faker.guid.random.toString(),
        codigo: faker.randomGenerator.fromPattern(["A", "F", "EE", 4,6,8,2,233,77]),
        enUso: faker,
        estatus: estatus,
        observaciones: observaciones,
      );
    });
  }

  @override
  List<SortColumnDetails> get sortedColumns => super.sortedColumns;

  @override
  List<DataGridRow> get rows => super.rows;

  makeRows() {
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: List.generate(row.getCells().length, (index){
      return Container(
        width: 80,
        height: 30,
        alignment: Alignment.center,
        child: Text(row.getCells()[index].toString()),
      );
    }));
  }
}

class Proveedor extends FakerDataProvider {

}
