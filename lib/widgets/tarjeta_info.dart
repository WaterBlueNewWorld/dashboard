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
      width: 460,
      height: 92,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: widget.ancho,
                  height: widget.altura,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                              Text(
                                widget.titulo,
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
