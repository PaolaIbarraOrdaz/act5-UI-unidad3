import 'package:ibarra/datos/datos.dart';
import 'package:ibarra/modelos/orden.dart';
import 'package:flutter/material.dart';

class OrdenesRecientes extends StatelessWidget {
  const OrdenesRecientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Órdenes recientes",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        SizedBox(
          height: 160,
          // color: Colors.blue,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: usuarioActual.ordenes.length,
              itemBuilder: (BuildContext context, int index) {
                Orden orden = usuarioActual.ordenes[index];
                return _construirPedidoReciente(context, orden);
              }),
        )
      ],
    );
  }

  Widget _construirPedidoReciente(BuildContext context, Orden orden) {
    return Container(
      width: 320,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.0, color: Colors.grey.shade200)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(orden.dulces.imagenUrl),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orden.dulces.nombre,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          orden.fiesta.nombre,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(orden.fecha,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            width: 48,
            decoration: BoxDecoration(
                color: const Color(0xffc40303),
                borderRadius: BorderRadius.circular(30)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
