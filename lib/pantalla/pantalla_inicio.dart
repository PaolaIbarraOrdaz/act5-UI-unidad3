import 'package:ibarra/datos/datos.dart';
import 'package:ibarra/modelos/fiesta.dart';
import 'package:ibarra/pantalla/pantalla_carro.dart';
import 'package:ibarra/pantalla/pantalla_fiesta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/orden_reciente.dart';

class Pantallainicio extends StatefulWidget {
  const Pantallainicio({Key? key}) : super(key: key);

  @override
  State<Pantallainicio> createState() => _PantallaInicioEstado();
}

class _PantallaInicioEstado extends State<Pantallainicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Dulcería Alegrías"),
        backgroundColor: const Color(0xffb50303),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.account_circle, size: 30)),
        actions: [
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PantallaCarrito())),
              child: Text(
                "Carrito (${usuarioActual.carroCompra.length})",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 0.8, color: Color(0xffce0303))),
                  hintText: "Busca dulces o paquetes fiesta",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.clear))),
            ),
          ),
          const OrdenesRecientes(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Paquetes Fiesta",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _paqueteFiesta()
            ],
          )
        ],
      ),
    );
  }

  _paqueteFiesta() {
    final List<Widget> fiestaLista = [];
    fiesta.forEach((Fiesta fiesta) {
      fiestaLista.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PantallaFiesta(fiesta: fiesta),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1.0, color: Colors.grey.shade200)),
          child: Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: fiesta.imagenUrl,
                    child: Image(
                      width: 150,
                      height: 150,
                      image: AssetImage(fiesta.imagenUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          fiesta.nombre,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingBar.builder(
                            initialRating: 5,
                            itemCount: fiesta.clasificacion.toInt(),
                            allowHalfRating: true,
                            minRating: 1,
                            unratedColor: Colors.grey,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            itemBuilder: (context, _) =>
                                (const Icon(Icons.star, color: Colors.amber)),
                            onRatingUpdate: (rating) {
                              Text(fiesta.clasificacion.toString());
                            }),
                        Text(
                          fiesta.descripcion,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });
    return Column(
      children: fiestaLista,
    );
  }
}
