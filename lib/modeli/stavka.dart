import 'package:flutter/material.dart';

class Film {
  final String name;
  final int year;
  final String producer;
  final String description;
  final IconData icon;

  // Neobavezna slika iz mape assets, npr. 'assets/spiderman.jpg'.
  // Ako je null, prikazuje se ikona.
  final String? slika;

  const Film({
    required this.name,
    required this.year,
    required this.producer,
    required this.description,
    required this.icon,
    this.slika,
  });
}

const List<Film> filmovi = [
  Film(
    name: 'The Lord of the Rings: The Return of the King',
    year: 2003,
    producer: 'Barrie M. Osborne, Peter Jackson, Fran Walsh',
    description:
        'Završni dio trilogije Petera Jacksona. Frodo i Sam nastavljaju put '
        'prema Planini sudbine kako bi uništili Prsten, dok Aragorn, Gandalf '
        'i saveznici vode posljednju bitku za Gondor protiv Saurona.',
    icon: Icons.landscape,
  ),
  Film(
    name: 'Spider-Man',
    year: 2002,
    producer: 'Laura Ziskin, Ian Bryce',
    description:
        'Tinejdžer Peter Parker biva ugrizen od genetski promijenjenog pauka '
        'i stječe nadljudske sposobnosti. Kao Spider-Man mora se suprotstaviti '
        'Zelenom Goblinu i naučiti što znači velika moć i velika odgovornost.',
    icon: Icons.pest_control,
  ),
  Film(
    name: 'A Complete Unknown',
    year: 2024,
    producer: 'Fred Berger, Alex Heineman',
    description:
        'Biografska drama o mladom Bobu Dylanu, koji početkom 1960-ih dolazi '
        'u New York i postaje glasom jedne generacije, sve do kontroverznog '
        'nastupa s električnom gitarom na festivalu u Newportu.',
    icon: Icons.music_note,
  ),
  Film(
    name: 'Lepa sela lepo gore',
    year: 1996,
    producer: 'Milko Josifov, Goran Bjelogrlić',
    description:
        'Ratna tragikomedija Srđana Dragojevića o skupini srpskih vojnika '
        'zarobljenih u tunelu tijekom rata u Bosni, dok se kroz sjećanja '
        'prikazuje prijateljstvo dvojice dječaka koji su postali neprijatelji.',
    icon: Icons.local_fire_department,
  ),
  Film(
    name: 'Superman',
    year: 2025,
    producer: 'Peter Safran, James Gunn',
    description:
        'Reboot franšize u režiji Jamesa Gunna. Superman pokušava uskladiti '
        'svoje kriptonsko podrijetlo i ljudski odgoj, dok se suočava s '
        'Lexom Luthorom i ponovno otvara pitanje nade i dobrote.',
    icon: Icons.shield,
  ),
];