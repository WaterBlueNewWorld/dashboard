import 'package:avatar_hover/avatar_hover.dart';
import 'package:binding_prueba/controllers/dashboard_controller.dart';
import 'package:binding_prueba/data_sources/dispositivos_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../widgets/menu_contextual.dart';

class Dashboard extends StatelessWidget {
  final Map<String, dynamic> jsonfalso = const {
    "numSucursal": 23,
    "nombreSucursal": null,
    "nombreDispositivo": "sdfd",
    "codigoDispositivo": "sdfsdf"
  };
  final DispositivosDataSource dispositivosDataSource = DispositivosDataSource();
  final RxController c = Get.put(DashboardController() as RxController);
  final GlobalKey llave = GlobalKey();

  double tNombre = 80;
  double tEtiqueta = 80;
  double tEstatus = 80;
  double tCodigo = 80;

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Row(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 500,
                  height: 500,
                  child: SfDataGrid(
                    source: dispositivosDataSource,
                    columnWidthMode: ColumnWidthMode.fill,
                    columnResizeMode: ColumnResizeMode.onResize,
                    selectionMode: SelectionMode.none,
                    onColumnResizeUpdate: (v) {
                      if (v.column.columnName == "Nombre") {
                        tNombre = v.width;
                        return true;
                      }
                      if (v.column.columnName == "Etiqueta") {
                        tEtiqueta = v.width;
                        return true;
                      }
                      if (v.column.columnName == "Estatus") {
                        tEstatus = v.width;
                        return true;
                      }
                      if (v.column.columnName == "Código Dispositivo") {
                        tCodigo = v.width;
                        return true;
                      }
                      return false;
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
                        columnName: 'Etiqueta',
                        width: tEtiqueta,
                        label: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
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
                        columnName: 'Estatus',
                        width: tEstatus,
                        label: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
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
                        columnName: 'Código Dispositivo',
                        width: tCodigo,
                        label: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
