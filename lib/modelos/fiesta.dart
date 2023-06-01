import 'package:ibarra/modelos/dulces.dart';

class Fiesta {
  final String imagenUrl;
  final String nombre;
  final String descripcion;
  final double clasificacion;
  final List<Dulces> menu;

  Fiesta(
      {required this.imagenUrl,
      required this.nombre,
      required this.descripcion,
      required this.clasificacion,
      required this.menu});
}
