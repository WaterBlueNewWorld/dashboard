import 'package:avatar_hover/avatar_hover.dart';
import 'package:binding_prueba/data_sources/bh_provider.dart';
import 'package:binding_prueba/data_sources/dispositivos_data_source.dart';
import 'package:binding_prueba/models/sucursal_model/sucursal.dart';
import 'package:binding_prueba/widgets/barra_herramientas.dart';
import 'package:binding_prueba/widgets/tarjeta_info.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
  final List<String> columnas = [
    "Nombre",
    "Etiqueta",
    "Sucursal",
    "Estatus",
    "Código Dispositivo",
  ];
  List<double> anchoColumnas = [
    200,
    300,
    300,
    200,
    300,
  ];
  final DispositivosDataSource dispositivosDataSource = DispositivosDataSource();
  DataGridController controller = DataGridController();
  final GlobalKey llave = GlobalKey();

  @override
  void initState() {
    super.initState();
    dispositivosDataSource.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(dispositivosDataSource.listaDispositivos.length);
          print(dispositivosDataSource.filas.length);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Dashboard"),
        elevation: 5.0,
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
              BarraHerramientas<BDHProvider>(
                actualizarCallback: (v, b){
                  dispositivosDataSource.makeRows();
                },
                busquedaCallback: (v, s) {

                },
                fechaCallback: (v) {},
              ),
              SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DropdownSearch<Sucursal>(
                    items: dispositivosDataSource.sucursales,
                    compareFn: (x, y) => x.isEqual(y),
                    itemAsString: (i) => i.nombre!,
                    onChanged: (Sucursal? i) {
                      dispositivosDataSource.filtrarDispositivos(i);
                    },
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 122,
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
                            var numero = v.rowColumnIndex.rowIndex - 1;
                            dispositivosDataSource.obtenerInfoFila(dispositivosDataSource.filas[numero].getCells());
                          },
                          onColumnResizeUpdate: (v) {
                            setState(() {
                              if (v.column.columnName == "Nombre") {
                                anchoColumnas[0] = v.width;
                              }
                              if (v.column.columnName == "Etiqueta") {
                                anchoColumnas[1] = v.width;
                              }
                              if (v.column.columnName == "Sucursal") {
                                anchoColumnas[2] = v.width;
                              }
                              if (v.column.columnName == "Estatus") {
                                anchoColumnas[3] = v.width;
                              }
                              if (v.column.columnName == "Código Dispositivo") {
                                anchoColumnas[4] = v.width;
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
                          columns: List.generate(columnas.length, (index) {
                            return GridColumn(
                              minimumWidth: 25,
                              columnName: columnas[index],
                              width: anchoColumnas[index],
                              label: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
                                ),
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.center,
                                child: Text(
                                  columnas[index],
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TarjetaInfo(
                      icono: Icons.info_outline,
                      titulo: "Informacion de dispositivo",
                      subtitulo: "A",
                      altura: MediaQuery.of(context).size.height,
                      ancho: 500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}