import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

typedef ListaAsync<T> = Future<List<T>> Function(String? x);
typedef bool Comparacion<T>(T x, T y);
typedef String ObjetoComoString<T>(T x);
typedef Funcion<T> = Function(T x);

class ListaDropDown<T> extends StatefulWidget {
  final ListaAsync<T>? async;
  final Comparacion<T> funcionComparar;
  final ObjetoComoString<T> objComoString;
  final List<T> listaObjetos;
  final Funcion<T> laFuncion;

  const ListaDropDown({
    super.key,
    required this.funcionComparar,
    required this.listaObjetos,
    required this.objComoString,
    required this.laFuncion
  }) : async = null;

  const ListaDropDown.objetosAsync({
    super.key,
    required this.async,
    required this.funcionComparar,
    required this.objComoString,
     required this.laFuncion,
  }) : listaObjetos = const [];

  @override
  State<ListaDropDown> createState() => StateListaDropdown();
}

class StateListaDropdown<T> extends State<ListaDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: widget.listaObjetos,
      asyncItems: widget.async != null
          ? (s) async {return await widget.async!(s);}
          : null,
      compareFn: (x, y) {
        return widget.funcionComparar(x, y);
      },
      itemAsString: (i) {
        return widget.objComoString(i);
      },
      onChanged: (T? i) {

      },
    );
  }
}