import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../models/estatus.dart';

typedef BusquedaFn<T> = void Function(T provider, String texto);
typedef FiltrosBusqueda<T> = void Function(T provider);
typedef FechaBusqueda<T> = void Function(T provider);
typedef ActualizarTabla<T> = void Function(T provider, bool completado);
typedef BorrarBusqueda<T> = void Function(T provider);

class BarraHerramientas<T> extends StatefulWidget {
  final BusquedaFn<T> busquedaCallback;
  final FiltrosBusqueda<T>? filtrosCallback;
  final FechaBusqueda<T> fechaCallback;
  final ActualizarTabla<T>? actualizarCallback;
  final BorrarBusqueda<T>? borrarBusquedaCallback;
  final List<Widget>? widgetsExtra;

  const BarraHerramientas({
    super.key,
    required this.busquedaCallback,
    required this.fechaCallback,
    this.filtrosCallback,
    this.actualizarCallback,
    this.borrarBusquedaCallback,
    this.widgetsExtra
  });

  @override
  BarraHerramientasState<T> createState() => BarraHerramientasState<T>();
}

class BarraHerramientasState<T> extends State<BarraHerramientas<T>> {
  bool visibleFiltros = false;
  bool visibleDate = false;
  final DateRangePickerController _pickerController = DateRangePickerController();
  TextEditingController controlBusqueda = TextEditingController();

  @override
  void initState() {
    _pickerController.selectedRange = PickerDateRange(
        DateTime.utc(DateTime.now().year.toInt(), DateTime.now().month.toInt(), 1),
        DateTime.utc(DateTime.now().year.toInt(), DateTime.now().month.toInt() + 1, 0)
            .add(const Duration(hours: 23, minutes: 59, seconds: 59, milliseconds: 999))
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 0,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 4, top: 4, bottom: 4),
                      child: SizedBox(
                        width: 340,
                        height: 50,
                        child: Consumer<T>(
                          builder: (context, opciones, child) {
                            return TextField(
                              controller: controlBusqueda,
                              onChanged: (v) {},
                              onSubmitted: (v) {
                                widget.busquedaCallback(opciones, v);
                              },
                              showCursor: true,

                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search
                                ),
                                suffixIcon: widget.borrarBusquedaCallback != null && controlBusqueda.text != ""
                                    ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controlBusqueda.text = "";
                                    });
                                    widget.borrarBusquedaCallback!(opciones);
                                  },
                                  icon: const Icon(Icons.close),
                                ) : null,
                                labelText: "Buscar",
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
                            );
                          },
                        ),
                      ),
                    ),
                    PortalTarget(
                      visible: visibleFiltros,
                      anchor: const Aligned(
                        target: Alignment(-1, 2),
                        follower: Alignment.topLeft,
                      ),
                      portalFollower: Material(
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: SizedBox(
                          width: 440,
                          height: 320,
                          child: Card(
                            elevation: 6,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ListView(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: const Text("Bueno"),
                                                      leading: Consumer<T>(
                                                        builder: (context, opciones, child) {
                                                          dynamic opc = opciones;
                                                          return Radio<Estatus>(
                                                            value: Estatus.bueno,
                                                            groupValue: opc.estatus,
                                                            onChanged: (Estatus? v) {
                                                              dynamic valorRadio = context.read<T>();
                                                              valorRadio.updateEstatus(v!);
                                                              if (kDebugMode) {
                                                                print("Estatus: ${valorRadio.estatus}");
                                                              }
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      onTap: () {
                                                        dynamic valorRadio = context.read<T>();
                                                        valorRadio.updateEstatus(Estatus.bueno);
                                                        if (kDebugMode) {
                                                          print("Situacion: ${valorRadio.estatus}");
                                                        }
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: const Text("Malo"),
                                                      leading: Consumer<T>(
                                                        builder: (context, opciones, child) {
                                                          dynamic opc = opciones;
                                                          return Radio<Estatus>(
                                                            value: Estatus.malo,
                                                            groupValue: opc.estatus,
                                                            onChanged: (Estatus? v) {
                                                              dynamic valorRadio = context.read<T>();
                                                              valorRadio?.updateEstatus(v!);
                                                              if (kDebugMode) {
                                                                print("Estatus: ${valorRadio.estatus}");
                                                              }
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      onTap: () {
                                                        dynamic valorRadio = context.read<T>();
                                                        valorRadio.updateEstatus(Estatus.bueno);
                                                        if (kDebugMode) {
                                                          print("Situacion: ${valorRadio.estatus}");
                                                        }
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: const Text("N/A"),
                                                      leading: Consumer<T>(
                                                        builder: (context, opciones, child) {
                                                          dynamic opc = opciones;
                                                          return Radio<Estatus>(
                                                            value: Estatus.na,
                                                            groupValue: opc.estatus,
                                                            onChanged: (Estatus? v) {
                                                              dynamic valorRadio = context.read<T>();
                                                              valorRadio.updateEstatus(v!);
                                                              if (kDebugMode) {
                                                                print("Estatus: ${valorRadio.estatus}");
                                                              }
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      onTap: () {
                                                        dynamic valorRadio = context.read<T>();
                                                        valorRadio.updateEstatus(Estatus.na);
                                                        if (kDebugMode) {
                                                          print("Situacion: ${valorRadio.estatus}");
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(color: Theme.of(context).brightness == Brightness.light
                                                ? Colors.black.withAlpha(20)
                                                : Colors.white.withAlpha(20), width: 1.0),
                                            right: BorderSide(color: Theme.of(context).brightness == Brightness.light
                                                ? Colors.black.withAlpha(20)
                                                : Colors.white.withAlpha(20), width: 1.0),
                                          ),
                                        ),
                                        child: Consumer<T>(
                                          builder: (context, opciones, child) {
                                            // dynamic opc = opciones;
                                            return TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(0),
                                                ),
                                                elevation: 0,
                                                fixedSize: const Size(210, 70),
                                              ),
                                              child: const Text("Cancelar"),
                                              onPressed: () {

                                                setState(() {
                                                  visibleFiltros = false;
                                                });
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(color: Theme.of(context).brightness == Brightness.light
                                                ? Colors.black.withAlpha(20)
                                                : Colors.white.withAlpha(20), width: 1.0),
                                            left: BorderSide(color: Theme.of(context).brightness == Brightness.light
                                                ? Colors.black.withAlpha(20)
                                                : Colors.white.withAlpha(20), width: 1.0),
                                          ),
                                        ),
                                        child: Consumer<T>(
                                          builder: (context, opciones, child) {
                                            dynamic opc = opciones;
                                            return TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(0),
                                                ),
                                                elevation: 0,
                                                fixedSize: const Size(210, 70),
                                              ),
                                              onPressed: () {
                                                opc.updateEstatusAnterior();
                                                widget.filtrosCallback!(opciones);
                                                setState(() {
                                                  visibleFiltros = false;
                                                });
                                              },
                                              child: const Text("Aceptar"),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: IconButton(
                        tooltip: "Filtros",
                        onPressed: () {
                          setState(() {
                            visibleFiltros = !visibleFiltros;
                          });
                        },
                        icon: const Icon(Icons.filter_alt_outlined),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    PortalTarget(
                      visible: visibleDate,
                      anchor: const Aligned(
                        target: Alignment(-1, 1),
                        follower: Alignment.topLeft,
                      ),
                      portalFollower: Material(
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: SizedBox(
                          height: 440,
                          width: 480,
                          child: Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SfDateRangePicker(
                                controller: _pickerController,
                                showActionButtons: true,
                                enablePastDates: true,
                                enableMultiView: false,
                                showTodayButton: true,
                                monthViewSettings: const DateRangePickerMonthViewSettings(
                                  showTrailingAndLeadingDates: true,
                                  firstDayOfWeek: 7,
                                ),
                                initialDisplayDate: DateTime.now(),
                                cancelText: "Cancelar",
                                confirmText: "Aceptar",
                                showNavigationArrow: true,
                                onSelectionChanged: (DateRangePickerSelectionChangedArgs v) {
                                  dynamic valorRadio = context.read<T>();
                                  valorRadio.updateBoolFecha(true);
                                  if (kDebugMode) {
                                    print(v.value);
                                  }
                                },
                                view: DateRangePickerView.month,
                                selectionMode: DateRangePickerSelectionMode.range,
                                onCancel: () {
                                  setState(() {
                                    visibleDate = !visibleDate;
                                  });
                                },
                                onSubmit: (Object? value) {
                                  dynamic provider = context.read<T>();
                                  provider.updateFechaInicial(_pickerController.selectedRange!.startDate ?? DateTime.now());
                                  provider.updateFechaFinal(_pickerController.selectedRange!.endDate!.add(const Duration(
                                    hours: 23,
                                    minutes: 59,
                                    seconds: 59,
                                    milliseconds: 999,
                                  )));
                                  widget.fechaCallback(provider);
                                  if (kDebugMode) {
                                    print("Fechas seleccionadas: "
                                        "${_pickerController.selectedRange?.startDate?.toIso8601String()}, "
                                        "${_pickerController.selectedRange?.endDate?.add(const Duration(
                                      hours: 23,
                                      minutes: 59,
                                      seconds: 59,
                                      milliseconds: 999,
                                    )).toIso8601String()}");
                                  }
                                  setState(() {
                                    visibleDate = !visibleDate;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: IconButton(
                        tooltip: "Filtrar por fecha",
                        onPressed: () {
                          setState(() {
                            visibleDate = !visibleDate;
                          });
                        },
                        icon: const Icon(Icons.calendar_today_outlined),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    widget.actualizarCallback != null
                        ? Consumer<T>(
                      builder: (context, opciones, child) {
                        return IconButton(
                          tooltip: "Actualizar",
                          onPressed: () {
                            widget.actualizarCallback!(opciones, true);
                          },
                          icon: const Icon(
                            Icons.update,
                          ),
                        );
                      },
                    )
                        : Container(),
                    const SizedBox(width: 20,),
                    Row(
                      children: widget.widgetsExtra ?? [],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Consumer<T>(
                    builder: (context, opciones, child) {
                      dynamic opc = opciones;
                      if (opc.filtroActivo || opc.fechaDiferente) {
                        return ElevatedButton(
                          onPressed: () {
                            opc.updateBoolFecha(false);
                            opc.valoresDefault();
                            setState(() {
                              _pickerController.selectedRange = PickerDateRange(
                                opc.fechaInicial,
                                opc.fechaFinal,
                              );
                            });
                            widget.filtrosCallback!(opciones);
                            widget.fechaCallback(opciones);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.5,
                          ),
                          child: const Text("Borrar filtros",),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}