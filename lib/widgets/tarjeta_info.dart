import 'package:flutter/material.dart';

class TarjetaInfo extends StatefulWidget {
  final Icon icono;
  final String titulo;
  final String subtitulo;

  const TarjetaInfo({
    super.key,
    required this.icono,
    required this.titulo,
    required this.subtitulo,
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
                  height: 92,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(
                        top: 7,
                        bottom: 14,
                        left: 15,
                        right: 60,
                      ),
                      leading: widget.icono,
                      title: Text(widget.titulo),
                      subtitle: Text(widget.subtitulo),
                      isThreeLine: true,
                    ),
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
