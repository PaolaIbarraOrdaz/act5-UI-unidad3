// Dulces

import 'package:ibarra/modelos/dulces.dart';
import 'package:ibarra/modelos/orden.dart';
import 'package:ibarra/modelos/fiesta.dart';
import 'package:ibarra/modelos/usuario.dart';

final _palanqueta = Dulces(
    imagenUrl: "assets/imagen/dulce31.png",
    nombre: "Palanqueta",
    precio: 10.00);

final _glorias = Dulces(
    imagenUrl: "assets/imagen/dulce32.png", nombre: "Glorias", precio: 15.00);

final _ate = Dulces(
    imagenUrl: "assets/imagen/dulce33.png", nombre: "Ate", precio: 15.00);

final _muegano = Dulces(
    imagenUrl: "assets/imagen/dulce34.png", nombre: "Mueganos", precio: 13.00);

final _alegrias = Dulces(
    imagenUrl: "assets/imagen/dulce35.png", nombre: "Alegrías", precio: 9.00);

final _pepitorias = Dulces(
    imagenUrl: "assets/imagen/dulce39.png",
    nombre: "Pepitorías",
    precio: 11.00);

final _borrachitos = Dulces(
    imagenUrl: "assets/imagen/dulce40.png",
    nombre: "Borrachitos",
    precio: 11.00);

final _mazapan = Dulces(
    imagenUrl: "assets/imagen/dulce41.png", nombre: "Mazapán", precio: 15.00);

// fiesta

final _fiesta1 = Fiesta(
    imagenUrl: "assets/imagen/fiesta1.png",
    nombre: "Paquete Boda",
    descripcion: "Los mejores dulces para tu boda.",
    clasificacion: 5,
    menu: [
      _palanqueta,
      _glorias,
      _ate,
      _muegano,
      _alegrias,
      _pepitorias,
      _borrachitos,
      _mazapan
    ]);

final _fiesta2 = Fiesta(
    imagenUrl: "assets/imagen/fiesta2.png",
    nombre: "Paquete Cumpleaños",
    descripcion: "Los mejores dulces para tu cumpleaños.",
    clasificacion: 4.1,
    menu: [_glorias, _ate, _muegano, _alegrias, _pepitorias, _borrachitos]);

final _fiesta3 = Fiesta(
    imagenUrl: "assets/imagen/fiesta3.png",
    nombre: "Paquete graduación",
    descripcion: "Los mejores dulces para tu graduación.",
    clasificacion: 5,
    menu: [_glorias, _ate, _alegrias, _pepitorias, _borrachitos, _mazapan]);

final _fiesta4 = Fiesta(
    imagenUrl: "assets/imagen/fiesta4.png",
    nombre: "Bautizo",
    descripcion: "Los mejores dulces de bautizo.",
    clasificacion: 4.3,
    menu: [_pepitorias, _glorias, _pepitorias, _borrachitos, _mazapan]);

final _fiesta5 = Fiesta(
    imagenUrl: "assets/imagen/fiesta5.png",
    nombre: "Fiestas patrias",
    descripcion: "Los mejores dulces mexicanos.",
    clasificacion: 4.0,
    menu: [_pepitorias, _muegano, _alegrias, _mazapan]);

// lista fiesta

final List<Fiesta> fiesta = [_fiesta1, _fiesta2, _fiesta3, _fiesta4, _fiesta5];

// Usuario actual

final usuarioActual = Usuario(nombre: "Paola Ibarra", ordenes: [
  Orden(
      fiesta: _fiesta2, dulces: _glorias, fecha: "Abril 30, 2023", cantidad: 1),
  Orden(
      fiesta: _fiesta1, dulces: _muegano, fecha: "Abril 28, 2023", cantidad: 3),
  Orden(
      fiesta: _fiesta2,
      dulces: _palanqueta,
      fecha: "Mayo 30, 2023",
      cantidad: 2),
  Orden(
      fiesta: _fiesta3, dulces: _mazapan, fecha: "Mayo 30, 2023", cantidad: 1),
  Orden(
      fiesta: _fiesta5, dulces: _alegrias, fecha: "Mayo 30, 2023", cantidad: 1)
], carroCompra: [
  Orden(
      fiesta: _fiesta4,
      dulces: _pepitorias,
      fecha: "Mayo 29, 2023",
      cantidad: 2),
  Orden(fiesta: _fiesta3, dulces: _ate, fecha: "Mayo 30, 2023", cantidad: 1),
  Orden(
      fiesta: _fiesta1, dulces: _mazapan, fecha: "Mayo 30, 2023", cantidad: 1),
  Orden(
      fiesta: _fiesta2, dulces: _alegrias, fecha: "Mayo 29, 2023", cantidad: 3),
  Orden(
      fiesta: _fiesta4,
      dulces: _palanqueta,
      fecha: "Mayo 30, 2023",
      cantidad: 2)
]);
