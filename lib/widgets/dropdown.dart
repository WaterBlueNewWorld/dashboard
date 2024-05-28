import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

typedef ListaAsync<T> = Future<List<T>> Function(String? x);
typedef Comparacion<T> = bool Function(T x, T y);
typedef ObjetoComoString<T> = String Function (T x);

class ListaDropDown<T> extends StatelessWidget {
  final ListaAsync<T>? async;
  final Comparacion<T> funcionComparar;
  final ObjetoComoString<T> objComoString;
  final List<T> listaObjetos;

  const ListaDropDown({
    super.key,
    required this.funcionComparar,
    required this.listaObjetos,
    required this.objComoString,
  }) : async = null;

  const ListaDropDown.objetosAsync({
    super.key,
    required this.async,
    required this.funcionComparar,
    required this.objComoString
  }) : listaObjetos = const [];

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: [],
      asyncItems: async,
      compareFn: funcionComparar,
      itemAsString: objComoString,
    );
  }
}
