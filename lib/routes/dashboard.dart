import 'package:avatar_hover/avatar_hover.dart';
import 'package:binding_prueba/data_sources/dispositivos_data_source.dart';
import 'package:binding_prueba/models/sucursal_model/sucursal.dart';
import 'package:binding_prueba/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../widgets/menu_contextual.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => StateDashboard();
}

class StateDashboard extends State<Dashboard> {
  final Map<String, dynamic> jsonfalso = const {
    "numSucursal": 23,
    "nombreSucursal": null,
    "nombreDispositivo": "sdfd",
    "codigoDispositivo": "sdfsdf"
  };
  final DispositivosDataSource dispositivosDataSource = DispositivosDataSource();
  DataGridController controller = DataGridController();
  final GlobalKey llave = GlobalKey();

  double tNombre = 200;
  double tEtiqueta = 300;
  double tEstatus = 200;
  double tCodigo = 300;

  @override
  void initState() {
    super.initState();
    inicializacion();
  }

  Future<void> inicializacion() async {
    await dispositivosDataSource.makeRows();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(dispositivosDataSource.listaDispositivos.length);
          print(dispositivosDataSource.filas.length);
          dispositivosDataSource.makeRows();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          AvatarHover(
            widgetKey: llave,
            context: context,
            online: true,
            statusWidth: 0,
            statusHeight: 0,
            height: 50,
            width: 45,
            avatarChild: const NetworkImage("https://marketplace.canva.com/EAFYecj_1Sc/1/0/1600w/canva-cream-and-black-simple-elegant-catering-food-logo-2LPev1tJbrg.jpg"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 65,),
              SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListaDropDown<Sucursal>(
                    funcionComparar: (dynamic i, dynamic s) => i.isEqual(s),
                    listaObjetos: dispositivosDataSource.sucursales,
                    objComoString: (dynamic i) => i.nombre!,
                    laFuncion: (v) {

                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  child: SfDataGrid(
                    rowsPerPage: 30,
                    controller: controller,
                    isScrollbarAlwaysShown: true,
                    highlightRowOnHover: true,
                    headerGridLinesVisibility: GridLinesVisibility.none,
                    source: dispositivosDataSource,
                    columnWidthMode: ColumnWidthMode.fill,
                    columnResizeMode: ColumnResizeMode.onResize,
                    selectionMode: SelectionMode.none,
                    allowColumnsResizing: true,
                    onCellTap: (DataGridCellTapDetails v) {

                    },
                    onColumnResizeUpdate: (v) {
                      setState(() {
                        if (v.column.columnName == "Nombre") {
                          tNombre = v.width;
                        }
                        if (v.column.columnName == "Etiqueta") {
                          tEtiqueta = v.width;
                        }
                        if (v.column.columnName == "Estatus") {
                          tEstatus = v.width;
                        }
                        if (v.column.columnName == "Código Dispositivo") {
                          tCodigo = v.width;
                        }
                      });
                      return true;
                    },
                    onCellSecondaryTap: (v) {
                      menuContextual(v.globalPosition, context, [
                        PopupMenuItem(
                          onTap: () {

                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.delete),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Eliminar",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ]);
                    },
                    columns: [
                      GridColumn(
                        minimumWidth: 25,
                        columnName: 'Nombre',
                        width: tNombre,
                        label: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
                          ),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text(
                            'Nombre',
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        minimumWidth: 25,
                        columnName: 'Etiqueta',
                        width: tEtiqueta,
                        label: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                          ),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text(
                            'Etiqueta',
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        minimumWidth: 25,
                        columnName: 'Estatus',
                        width: tEstatus,
                        label: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                          ),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text(
                            'Estatus',
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        minimumWidth: 25,
                        columnName: 'Código Dispositivo',
                        width: tCodigo,
                        label: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(4)),
                          ),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: const Text(
                            'Código Dispositivo',
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              const Flexible(
                child: SizedBox(
                  width: 500,
                  height: 120,
                  child: Card(
                    child: Center(child: Text("prueba"),),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}