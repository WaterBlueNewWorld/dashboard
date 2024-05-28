import 'package:binding_prueba/models/dispositivo_model/dispositivo.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    makeRows();
  }

  @override
  List<DataGridRow> get rows => filas;

  generadorDeDatos() {
    listaDispositivos = List.generate(20, (index) {
      return Dispositivo(
        nombre: faker.person.firstName(),
        etiqueta: faker.guid.random.toString(),
        codigo: faker.randomGenerator.fromPattern(["A", "F", "EE", 4,6,8,2,233,77]),
        enUso: true,
        estatus: faker.geo.toString(),
        observaciones: faker.lorem.random.amount((_){random.string(10);}, 10).join("").toString(),
        ip: faker.internet.ipv4Address(),
      );
    });
  }

  makeRows() async {
    generadorDeDatos();
    Future.delayed(const Duration(milliseconds: 700), () {
      filas = listaDispositivos.map((e) {
        return DataGridRow(cells: [
          DataGridCell(columnName: "Nombre", value: e.nombre),
          DataGridCell(columnName: "Etiqueta", value: e.etiqueta),
          DataGridCell(columnName: "Estatus", value: e.estatus),
          DataGridCell(columnName: "Código Dispositivo", value: e.codigo),
        ]);
      }).toList(growable: false);
    });
    notifyListeners();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: List.generate(row.getCells().length, (index){
      return Container(
        width: 80,
        height: 30,
        alignment: Alignment.center,
        color: row.getCells()[index].columnName == "Estatus"
            && row.getCells()[index].value == "N/A"
            ? Colors.red : Colors.white,
        child: Text(row.getCells()[index].value.toString()),
      );
    }));
  }
}
