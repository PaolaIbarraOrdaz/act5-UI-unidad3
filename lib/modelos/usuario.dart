import 'package:ibarra/modelos/orden.dart';

class Usuario {
  final String nombre;
  final List<Orden> ordenes;
  final List<Orden> carroCompra;

  Usuario(
      {required this.nombre, required this.ordenes, required this.carroCompra});
}
