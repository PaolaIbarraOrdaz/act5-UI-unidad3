import 'package:ibarra/modelos/dulces.dart';
import 'package:ibarra/modelos/fiesta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PantallaFiesta extends StatefulWidget {
  final Fiesta fiesta;

  const PantallaFiesta({Key? key, required this.fiesta}) : super(key: key);

  @override
  State<PantallaFiesta> createState() => _PantallaFiestaEstado();
}

class _PantallaFiestaEstado extends State<PantallaFiesta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(
              tag: widget.fiesta.imagenUrl,
              child: Image(
                height: 220,
                width: MediaQuery.of(context).size.width,
                image: AssetImage(widget.fiesta.imagenUrl),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    iconSize: 35,
                    color: const Color(0xffb60303),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.fiesta.nombre,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Dulcería alegrías",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  allowHalfRating: true,
                  unratedColor: Colors.grey,
                  itemSize: 20,
                  itemBuilder: (context, _) => (const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )),
                  onRatingUpdate: (rating) {
                    Text(rating.toString());
                  }),
              const SizedBox(height: 10),
              Text(
                widget.fiesta.descripcion,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  splashColor: Colors.grey,
                  elevation: 4,
                  hoverElevation: 10,
                  color: const Color(0xffaf0303),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {},
                  child: const Text(
                    "Reseñas",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              MaterialButton(
                  splashColor: Colors.grey,
                  elevation: 4,
                  hoverElevation: 10,
                  color: const Color(0xffc70303),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {},
                  child: const Text(
                    "Contacto",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Menu",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.2),
        ),
        const SizedBox(height: 10),
        Expanded(
            child: GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          children: List.generate(widget.fiesta.menu.length, (index) {
            Dulces dulces = widget.fiesta.menu[index];
            return _construirMenuElementos(dulces);
          }),
        ))
      ],
    ));
  }

  Widget _construirMenuElementos(Dulces menuElementos) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175,
            width: 175,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(menuElementos.imagenUrl),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 175,
            height: 175,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black45.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                menuElementos.nombre,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "\$${menuElementos.precio}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Positioned(
              bottom: 15,
              right: 10,
              child: Container(
                // width: 48,
                decoration: BoxDecoration(
                    color: const Color(0xffae0303),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    )),
              ))
        ],
      ),
    );
  }
}
