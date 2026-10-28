
import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';


class InfoPaisGeneral extends StatelessWidget {
  InfoPaisGeneral({super.key});

    // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {

    // Recogemos el país del repositorio
    Pais pais = _repository.infoPais();
    
    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Imagen, nombre, capital y descripción, de forma similar a como se muestra en el enunciado
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del país'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                pais.imagen ?? '',
                width: 300,
                height: 220,
             
              ),
              const SizedBox(height: 14),
              Text(
                pais.nombre,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Capital: ${pais.capital}',
              ),
              const SizedBox(height: 14),
              Text(
                pais.descripcion ?? 'Sin descripción disponible.',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
