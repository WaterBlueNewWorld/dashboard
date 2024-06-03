import 'package:dashboard/models/dispositivo_model/dispositivo.dart';
import 'package:dashboard/models/sucursal_model/sucursal.dart';
import 'package:dashboard/utils/solicitudes_api.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../models/estatus.dart';

class DispositivosDataSource extends DataGridSource {
  final Faker faker = Faker(seed: 453233);

  int filasPorPagina = 20;
  int offset = 200;
  bool cargando = true;

  List<DataGridRow> filas = [];
  static late Dispositivos dispositivos;
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
      notifyListeners();
      print(s);
      throw Exception(s.toString());
    });
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
    print(newPageIndex);
    print(oldPageIndex);
    if (newPageIndex != 0 || newPageIndex > 0) {
      offset = (newPageIndex * oldPageIndex).floor();
      notifyListeners();
      return Future<bool>.value(true);
    }
    if (newPageIndex == 0 || newPageIndex < 0) {
      Future<bool>.value(false);
    }
    return Future<bool>.value(false);
  }

  @override
  List<DataGridRow> get rows => filas;

  Future generadorDeDatos() async {
    try {
      dispositivos = await SolicitudesApi(
        url: "http://localhost:3000/api/dispositivos",
      ).obtenerDispositivos(
        maxFilas: 20,
        fechaInicial: '',
        fechaFinal: '',
      );
    } catch (ex) {
      throw Exception(ex.toString());
    }
  }

  Future makeRows() async {
    cargando = true;
    await generadorDeDatos().whenComplete(() {
      cargando = false;
      filas = dispositivos.dispositivos.map((e) {
        return DataGridRow(cells: [
          DataGridCell<String>(columnName: "Nombre", value: e.nombre),
          DataGridCell<String>(columnName: "Etiqueta", value: e.etiqueta),
          //DataGridCell<String>(columnName: "Sucursal", value: e.sucursal.nombre),
          DataGridCell<String>(columnName: "Estatus", value: e.estatus),
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
        //DataGridCell<String>(columnName: "Sucursal", value: e.sucursal.nombre),
        DataGridCell<String>(columnName: "Estatus", value: e.estatus),
        DataGridCell<String>(columnName: "Código Dispositivo", value: e.idInventario),
      ]);
    }).toList();
    notifyListeners();
  }

  void filtrarDispositivos(Sucursal? sucursal) {
    // var listaSort = listaDispositivos.dispositivos.where((test) {
    //   if (sucursal?.nombre != null) {
    //     return test.sucursal.nombre == sucursal?.nombre;
    //   } else {
    //     return false;
    //   }
    // }).toList();
    // makeRowsSort(listaSort);
  }

  void filtrarEstatus(String estatus) {
    // var listaFiltrada = listaDispositivos.dispositivos.where((test) {
    //   return test.estatus.nombre == estatus;
    // }).toList();
    // makeRowsSort(listaFiltrada);
  }

  void busquedaDispositivos(String query) {
    var lista = dispositivos.dispositivos.where((e) {
      return e.toStringFormateada().contains(query);
    }).toList();
    makeRowsSort(lista);
  }

  String obtenerInfoFila(int numero) {
    return dispositivos.dispositivos[numero].toStringFormateada();
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
        // Container(
        //   padding: const EdgeInsets.all(8.0),
        //   alignment: Alignment.centerLeft,
        //   child: Text(
        //     row.getCells()[4].value.toString(),
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ),
      ],
    );
  }
}
