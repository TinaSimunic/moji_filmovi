import 'package:flutter/material.dart';

import '../modeli/stavka.dart';

class EkranDetalja extends StatelessWidget {
  final Film film;
  final bool jePogledan;

  const EkranDetalja({
    super.key,
    required this.film,
    required this.jePogledan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(film.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal),
                ),
                child: Row(
                  children: [
                    if (film.slika != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          film.slika!,
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(film.icon, size: 48, color: Colors.teal),
                        ),
                      )
                    else
                      Icon(film.icon, size: 48, color: Colors.teal),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            film.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Godina: ${film.year}'),
                          Text('Producent: ${film.producer}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                film.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: jePogledan
                        ? null
                        : () {
                            Navigator.pop(context, true);
                          },
                    child: Text(jePogledan ? 'Pogledan' : 'Pogledala sam'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Natrag'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}