import 'package:flutter/material.dart';

import '../modeli/stavka.dart';
import 'ekran_detalja.dart';

class EkranPopisa extends StatefulWidget {
  const EkranPopisa({super.key});

  @override
  State<EkranPopisa> createState() => _EkranPopisaState();
}

class _EkranPopisaState extends State<EkranPopisa> {
  // Nazivi filmova koje sam označila kao pogledane.
  final Set<String> pogledani = {};

  Future<void> otvoriDetalje(Film film) async {
    final rezultat = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => EkranDetalja(
          film: film,
          jePogledan: pogledani.contains(film.name),
        ),
      ),
    );

    if (rezultat == true) {
      setState(() {
        pogledani.add(film.name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Moji filmovi'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filmovi.length,
        itemBuilder: (context, index) {
          final film = filmovi[index];
          return FilmKartica(
            film: film,
            jePogledan: pogledani.contains(film.name),
            onOpen: () => otvoriDetalje(film),
          );
        },
      ),
    );
  }
}

class FilmKartica extends StatelessWidget {
  final Film film;
  final bool jePogledan;
  final VoidCallback onOpen;

  const FilmKartica({
    super.key,
    required this.film,
    required this.jePogledan,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final boja = jePogledan ? Colors.green : Colors.grey;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (film.slika != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                film.slika!,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(film.icon, size: 32, color: boja),
              ),
            )
          else
            Icon(film.icon, size: 32, color: boja),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  film.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${film.year}'),
              ],
            ),
          ),
          IconButton(
            onPressed: onOpen,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}