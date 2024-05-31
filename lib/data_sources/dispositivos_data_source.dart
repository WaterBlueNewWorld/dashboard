import 'package:binding_prueba/models/dispositivo_model/dispositivo.dart';
import 'package:binding_prueba/models/sucursal_model/sucursal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/estatus.dart';
import '../models/tipo.dart';

class DispositivosDataSource extends DataGridSource {
  final Faker faker = Faker(seed: 453233);
  List<DataGridRow> filas = [];
  bool cargando = true;
  List<Dispositivo> listaDispositivos = [];
  List<Sucursal> sucursales = [
    const Sucursal(nombre: "2480"),
    const Sucursal(nombre: "2481"),
    const Sucursal(nombre: "2482"),
    const Sucursal(nombre: "2483"),
  ];

  DispositivosDataSource() {
    makeRows().whenComplete(() {
      notifyListeners();
    }).catchError((s) {
      throw Exception(s.toString());
    });
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => filas;

  Future generadorDeDatos() async {
    Future.delayed(const Duration(milliseconds: 700), () {
      listaDispositivos = List.generate(20, (index) {
        return Dispositivo(
          nombre: faker.person.name(),
          etiqueta: faker.guid.guid(),
          idInventario: faker.guid.guid() + index.toString(),
          enUso: true,
          estatus: Estatus.values[random.integer(5, min: 0)],
          observaciones: faker.lorem.random.amount((_){random.string(10);}, 10).join("").toString(),
          ip: faker.internet.ipv4Address(),
          sucursal: sucursales[random.integer(4, min: 0)],
          tipo: Tipo.a,
          numInventario: faker.randomGenerator.integer(3000),
        );
      });
    });
    notifyListeners();
  }

  Future makeRows() async {
    cargando = true;
    await generadorDeDatos().whenComplete(() {
      cargando = false;
      filas = listaDispositivos.map((e) {
        return DataGridRow(cells: [
          DataGridCell<String?>(columnName: "Nombre", value: e.nombre),
          DataGridCell<String>(columnName: "Etiqueta", value: e.etiqueta),
          DataGridCell<String>(columnName: "Sucursal", value: e.sucursal.nombre),
          DataGridCell<String>(columnName: "Estatus", value: e.estatus.nombre),
          DataGridCell<String>(columnName: "Código Dispositivo", value: e.idInventario),
        ]);
      }).toList(growable: false);
      notifyListeners();
    });
  }

  Future makeRowsSort(List<Dispositivo> dispositivosSort) async {
    filas = dispositivosSort.map((e) {
      return DataGridRow(cells: [
        DataGridCell<String?>(columnName: "Nombre", value: e.nombre),
        DataGridCell<String>(columnName: "Etiqueta", value: e.etiqueta),
        DataGridCell<String>(columnName: "Sucursal", value: e.sucursal.nombre),
        DataGridCell<String>(columnName: "Estatus", value: e.estatus.nombre),
        DataGridCell<String>(columnName: "Código Dispositivo", value: e.idInventario),
      ]);
    }).toList();
    notifyListeners();
  }

  void filtrarDispositivos(Sucursal? sucursal) {
    var listaSort = listaDispositivos.where((test) {
      if (sucursal?.nombre != null) {
        return test.sucursal.nombre == sucursal?.nombre;
      } else {
        return false;
      }
    }).toList();
    makeRowsSort(listaSort);
  }

  void filtrarEstatus(String estatus) {
    var listaFiltrada = listaDispositivos.where((test) {
      return test.estatus.nombre == estatus;
    }).toList();
    makeRowsSort(listaFiltrada);
  }

  String obtenerInfoFila(int numero) {
    return listaDispositivos[numero].toStringFormateada();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: [
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[0].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[1].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[2].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[3].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            row.getCells()[4].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
