import 'package:dashboard/models/dispositivo_model/dispositivo.dart';
import 'package:dashboard/models/sucursal_model/sucursal.dart';
import 'package:dashboard/utils/solicitudes_api.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DispositivosDataSource extends DataGridSource {
  final Faker faker = Faker(seed: 453233);

  int filasPorPagina = 200;
  int offset = 0;
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
      throw Exception(s.toString());
    });
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
    if (newPageIndex > oldPageIndex) {
      offset = (filasPorPagina * newPageIndex).floor();
      makeRows();
      notifyListeners();
      return Future<bool>.value(true);
    } else if (newPageIndex < oldPageIndex) {
      if (newPageIndex == 0) {
        offset = 0;
        makeRows();
        notifyListeners();
      } else {
        offset = (filasPorPagina * newPageIndex).floor();
        makeRows();
        notifyListeners();
      }
      return Future<bool>.value(true);
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
        maxFilas: filasPorPagina,
        fechaInicial: '',
        fechaFinal: '',
        offset: offset == 0 ? null : offset
      ).then((e) {
        return Future.value(e);
      });
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

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    if (sortColumn.sortDirection == DataGridSortDirection.ascending) {
      filas.sort((a, b) {
        String aNombre = a
            .getCells()
            .firstWhere((element) => element.columnName == sortColumn.name)
            .value
            .toString();
        String bNombre = b
            .getCells()
            .firstWhere((element) => element.columnName == sortColumn.name)
            .value
            .toString();
        return aNombre.compareTo(bNombre);
      });
    }
    if (sortColumn.sortDirection == DataGridSortDirection.descending) {
      filas.sort((a, b) {
        String aNombre = b
            .getCells()
            .firstWhere((element) => element.columnName == sortColumn.name)
            .value
            .toString();
        String bNombre = a
            .getCells()
            .firstWhere((element) => element.columnName == sortColumn.name)
            .value
            .toString();
        return aNombre.compareTo(bNombre);
      });
    }
    return super.compare(a, b, sortColumn);
  }

  void filtrarDispositivos(Sucursal? sucursal) {
    // var listaSort = dispositivos.dispositivos.where((test) {
    //   if (sucursal?.nombre != null) {
    //     return test.sucursal.nombre == sucursal?.nombre;
    //   } else {
    //     return false;
    //   }
    // }).toList();
    // makeRowsSort(listaSort);
  }

  void filtrarEstatus(String? estatus) {
    if (estatus != null) {
      var listaFiltrada = dispositivos.dispositivos.where((test) {
        return test.estatus == estatus;
      }).toList();
      makeRowsSort(listaFiltrada);
    } else {
      makeRows();
    }
  }

  void busquedaDispositivos(String query) {
    var lista = dispositivos.dispositivos.where((e) {
      return e.toStringFormateada().toLowerCase().contains(query);
    }).toList();
    makeRowsSort(lista);
  }

  String obtenerInfoFila(int numero) {
    var info = filas[numero].getCells();
    String infoString = "";
    info.forEach((a) {
      infoString += "${a.columnName}: ${a.value} \n";
    });

    return infoString;
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
