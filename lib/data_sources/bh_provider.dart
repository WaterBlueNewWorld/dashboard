import 'package:flutter/material.dart';

import '../models/estatus.dart';

class BDHProvider extends ChangeNotifier {
  bool _fechaDiferente = false;
  final DateTime _fechaInicial = DateTime.utc(
    DateTime.now().year.toInt(),
    DateTime.now().month.toInt(),
    1,
  );

  final DateTime _fechaFinal = DateTime.utc(
    DateTime.now().year.toInt(),
    // Se adelanta un mes de la fecha actual, y luego se toma el dia 0
    // del mes para asi obtener el último día del mes actual
    DateTime.now().month.toInt() + 1,
    0,
  );
  late DateTime _fechaInicialSeleccion;
  late DateTime _fechaFinalSeleccion;

  Estatus? _estatusAnterior;
  Estatus? estatus = Estatus.bueno;

  bool get filtroActivo => _fechaDiferente;
  DateTime get fechaInicial => _fechaInicial;
  // Se le agrega las horas y fechas de las 11:59:59.99 para que tome
  // el dia completo el query del lado de la API
  DateTime get fechaFinal => _fechaFinal.add(
    const Duration(
      hours: 23,
      minutes: 59,
      seconds: 59,
      milliseconds: 999,
    ),
  );
  Estatus? get estatusAnterior => _estatusAnterior;
  bool get fechaDiferente => _fechaDiferente;

  DateTime get fechaInicialSeleccion => _fechaInicialSeleccion;
  DateTime get fechaFinalSeleccion => _fechaFinalSeleccion.add(
    const Duration(
      hours: 23,
      minutes: 59,
      seconds: 59,
      milliseconds: 999,
    ),
  );

  void updateBoolFecha(bool x) {
    _fechaDiferente = x;
    notifyListeners();
  }

  void updateFechaInicial(DateTime value) {
    _fechaInicialSeleccion = value;
    notifyListeners();
  }

  void updateFechaFinal(DateTime value) {
    _fechaFinalSeleccion = value;
    notifyListeners();
  }

  void updateEstatus(Estatus newEstatus) {
    estatus = newEstatus;
    notifyListeners();
  }

  void valoresDefault() {
    _fechaInicialSeleccion = _fechaInicial;
    _fechaFinalSeleccion = _fechaFinal;
    notifyListeners();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is BDHProvider;
  }

  @override
  int get hashCode => Object.hash(this, this);

}