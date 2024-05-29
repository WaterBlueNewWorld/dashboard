import 'package:binding_prueba/models/dispositivo_model/dispositivo.dart';
import 'package:binding_prueba/models/sucursal_model/sucursal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DispositivosDataSource extends DataGridSource {
  final Faker faker = Faker(seed: 453233);
  List<DataGridRow> filas = [];
  List<Dispositivo> listaDispositivos = [];
  List<Sucursal> sucursales = [
    const Sucursal(nombre: "2480"),
    const Sucursal(nombre: "2481"),
    const Sucursal(nombre: "2482"),
    const Sucursal(nombre: "2483"),
  ];

  DispositivosDataSource() {
    generadorDeDatos().whenComplete(() {
      makeRows();
    });
  }

  @override
  List<DataGridRow> get rows => filas;

  Future generadorDeDatos() async {
    Future.delayed(const Duration(milliseconds: 700), () {
      listaDispositivos = List.generate(20, (index) {
        return Dispositivo(
          nombre: faker.person.name(),
          etiqueta: faker.guid.guid(),
          codigo: faker.guid.guid() + index.toString(),
          enUso: true,
          estatus: faker.geo.latitude().toString(),
          observaciones: faker.lorem.random.amount((_){random.string(10);}, 10).join("").toString(),
          ip: faker.internet.ipv4Address(),
          sucursal: sucursales[random.integer(4, min: 0)]
        );
      });
    });
    notifyListeners();
  }

  Future makeRows() async {
    filas = listaDispositivos.map((e) {
      return DataGridRow(cells: [
        DataGridCell<String?>(columnName: "Nombre", value: e.nombre),
        DataGridCell<String>(columnName: "Etiqueta", value: e.etiqueta),
        DataGridCell<String>(columnName: "Sucursal", value: e.sucursal.nombre),
        DataGridCell<String>(columnName: "Estatus", value: e.estatus),
        DataGridCell<String>(columnName: "Código Dispositivo", value: e.codigo),
      ]);
    }).toList();
    notifyListeners();
  }

  Future makeRowsSort(List<Dispositivo> dispositivosSort) async {
    filas = dispositivosSort.map((e) {
      return DataGridRow(cells: [
        DataGridCell<String?>(columnName: "Nombre", value: e.nombre),
        DataGridCell<String>(columnName: "Etiqueta", value: e.etiqueta),
        DataGridCell<String>(columnName: "Sucursal", value: e.sucursal.nombre),
        DataGridCell<String>(columnName: "Estatus", value: e.estatus),
        DataGridCell<String>(columnName: "Código Dispositivo", value: e.codigo),
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

  void obtenerInfoFila(List<DataGridCell> celdas) {
    Map<String, dynamic> celdaToJson = {};
    celdas.map((item){
      celdaToJson.addAll({
        "Nombre": item.columnName,
        "valor": item.value,
      });
    });
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
