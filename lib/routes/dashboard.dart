import 'dart:io';
import 'dart:typed_data';

import 'package:avatar_hover/avatar_hover.dart';
import 'package:binding_prueba/data_sources/bh_controller.dart';
import 'package:binding_prueba/data_sources/dispositivos_data_source.dart';
import 'package:binding_prueba/utils/tabla_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:binding_prueba/models/estatus.dart';
import 'package:binding_prueba/models/sucursal_model/sucursal.dart';
import 'package:binding_prueba/widgets/barra_herramientas.dart';
import 'package:binding_prueba/widgets/tarjeta_info.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:file_saver/file_saver_web.dart';
import 'package:file_saver/file_saver.dart';

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
  final ControlTablaDashboard controlTabla = ControlTablaDashboard();
  final GlobalKey llave = GlobalKey();
  final GlobalKey<SfDataGridState> _llaveTabla = GlobalKey<SfDataGridState>();
  String infoCelda = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: kDebugMode,
        child: FloatingActionButton(
          onPressed: () {
            print(dispositivosDataSource.cargando.toString());
          },
          child: Icon(Icons.add),
        ),
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
            avatarChild: const NetworkImage("https://avatars.githubusercontent.com/u/62195353?v=4"),
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
              Flexible(
                child: BarraHerramientas<BDHProvider>(
                  actualizarCallback: (v, b){
                    dispositivosDataSource.makeRows();
                  },
                  filtrosCallback: (v) {
                    dispositivosDataSource.filtrarEstatus(v.estatus!.nombre);
                  },
                  busquedaCallback: (v, s) {
                    //dispositivosDataSource.busquedaDispositivos();
                  },
                  // fechaCallback: (v) {
                  //
                  // },
                  widgetsExtra: [
                    SizedBox(
                      child: IconButton(
                        tooltip: "Exportar tabla",
                        icon: const Icon(Icons.file_download_rounded),
                        onPressed: () {
                          exportarExcel();
                        },
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropdownSearch<Sucursal>(
                          items: dispositivosDataSource.sucursales,
                          compareFn: (x, y) => x.isEqual(y),
                          itemAsString: (i) => i.nombre!,
                          onChanged: (Sucursal? i) {
                            context.read<BDHProvider>().updateFiltroActivo(true);
                            dispositivosDataSource.filtrarDispositivos(i);
                          },
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Sucursal",
                              prefixIcon: const Icon(
                                  Icons.store_mall_directory_outlined
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.secondary,
                                  width: 1.5,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.secondary,
                                  width: 1.5,
                                ),
                              ),
                              labelStyle: const TextStyle(
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.secondary,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                          key: _llaveTabla,
                          rowsPerPage: 30,
                          controller: controlTabla,
                          isScrollbarAlwaysShown: true,
                          highlightRowOnHover: true,
                          headerGridLinesVisibility: GridLinesVisibility.none,
                          source: dispositivosDataSource,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnResizeMode: ColumnResizeMode.onResize,
                          allowSorting: true,
                          selectionMode: SelectionMode.none,
                          allowColumnsResizing: true,
                          onCellTap: (DataGridCellTapDetails v) {
                            var numero = v.rowColumnIndex.rowIndex - 1;
                            setState(() {
                              infoCelda = DispositivosDataSource.listaDispositivos[numero].toStringFormateada();
                            });
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
                      titulo: "Información de dispositivo",
                      subtitulo: infoCelda,
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

  Future exportarExcel() async {
    final xlsio.Workbook wb = _llaveTabla.currentState!.exportToExcelWorkbook();
    final List<int> bytes = wb.saveAsStream();
    Uint8List bytesUint = Uint8List.fromList(bytes);
    await FileSaver.instance.saveFile(
      name: 'Datos Dashboard',
      bytes: bytesUint,
      mimeType: MimeType.microsoftExcel,
      ext: 'xlsx',
    );
    wb.dispose();
  }
}
