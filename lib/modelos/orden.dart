import 'package:ibarra/modelos/dulces.dart';
import 'package:ibarra/modelos/fiesta.dart';

class Orden {
  final Fiesta fiesta;
  final Dulces dulces;
  final String fecha;
  final int cantidad;

  Orden(
      {required this.fiesta,
      required this.dulces,
      required this.fecha,
      required this.cantidad});
}
