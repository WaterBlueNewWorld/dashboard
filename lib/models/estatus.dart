enum Estatus {
  procesado,
  activo,
  enviado,
  descargado,
  cancelado,
  na
}

extension Valor on Estatus {
  static const Map<Estatus, String> _nombre = {
    Estatus.procesado: "Procesado",
    Estatus.activo: "Activo",
    Estatus.enviado: "Enviado",
    Estatus.descargado: "Descargado",
    Estatus.cancelado: "Cancelado",
    Estatus.na: "N/A"
  };

  String get nombre => _nombre[this] ??= "";
}