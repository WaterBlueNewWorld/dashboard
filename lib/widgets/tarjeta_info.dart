import 'package:flutter/material.dart';

class TarjetaInfo extends StatefulWidget {
  final IconData icono;
  final String titulo;
  final String subtitulo;
  final double? altura;
  final double? ancho;

  const TarjetaInfo({
    super.key,
    required this.icono,
    required this.titulo,
    required this.subtitulo,
    this.altura,
    this.ancho,
  });

  @override
  State<TarjetaInfo> createState() => _TarjetaInfoState();
}

class _TarjetaInfoState extends State<TarjetaInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.ancho,
      height: widget.altura,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    widget.icono,
                    size: 30,
                  ),
                  const SizedBox(width: 8,),
                  Flexible(
                    child: Text(
                      widget.titulo,
                      style: const TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(widget.subtitulo),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
