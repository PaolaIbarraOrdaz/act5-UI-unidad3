import 'package:ibarra/datos/datos.dart';
import 'package:ibarra/modelos/orden.dart';
import 'package:flutter/material.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({Key? key}) : super(key: key);

  @override
  State<PantallaCarrito> createState() => _PantallaCarritoEstado();
}

class _PantallaCarritoEstado extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    double totalPrecio = 0.0;
    usuarioActual.carroCompra.forEach((Orden orden) {
      totalPrecio += orden.dulces.precio * orden.cantidad;
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Carrito (${usuarioActual.carroCompra.length})"),
        centerTitle: true,
        backgroundColor: const Color(0xffbf0303),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index < usuarioActual.carroCompra.length) {
              Orden orden = usuarioActual.carroCompra[index];
              return _construirCarrito(orden);
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Tiempo total estimado",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "25 min",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Costo total",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${totalPrecio.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80)
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(thickness: 1.0, color: Colors.grey),
          itemCount: usuarioActual.carroCompra.length + 1),
      bottomSheet: Container(
        height: 80,
        decoration: const BoxDecoration(color: Color(0xff0d0000), boxShadow: [
          BoxShadow(blurRadius: 6, color: Colors.black26, offset: Offset(0, -1))
        ]),
        child: const Center(
          child: Text(
            "VERIFICAR",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _construirCarrito(Orden orden) {
    return SizedBox(
      height: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(orden.dulces.imagenUrl),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          orden.dulces.nombre,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          orden.fiesta.nombre,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.8, color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "-",
                                style: TextStyle(
                                    color: Color(0xffe80303),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                orden.cantidad.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "+",
                                style: TextStyle(
                                    color: Color(0xffe80303),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            child: Text(
              "\$${orden.dulces.precio * orden.cantidad}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
