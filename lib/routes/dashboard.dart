import 'package:avatar_hover/avatar_hover.dart';
import 'package:binding_prueba/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  final Map<String, dynamic> jsonfalso = const {
    "numSucursal": 23,
    "nombreSucursal": null,
    "nombreDispositivo": "sdfd",
    "codigoDispositivo": "sdfsdf"
  };
  final RxController c = Get.put(DashboardController() as RxController);
  final GlobalKey llave = GlobalKey();

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Texto de arriba"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
      body: Center(
        child: Scrollbar(
          child: ListView(
            children: const [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("AAAAA")
                      // ListaDropDown(
                      //   funcionComparar: (t, r) => false,
                      //   listaObjetos: listaObjetos,
                      //   objComoString: objComoString,
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
