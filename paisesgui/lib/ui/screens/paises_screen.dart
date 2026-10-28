import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class PaisesScreen extends StatelessWidget {
  PaisesScreen( {
    super.key,
  });
  
  // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              width:500,
              child: _creaListaPaises(_repository.getPaises())), 
      )
    );
  }

  Widget _creaListaPaises(List<Pais> paises) {
    // Recibimos la lista de paises
    
    // TO-DO
    // Debemos utilizar un ListView.builder para recorrer la lista de países
    // y generar un widget personalizado de tipo PaisCard, con la imagen y el nombre.
    return ListView.builder(
      itemCount: paises.length,
      itemBuilder: (BuildContext context, int index) {
        final Pais pais = paises[index];
        return PaisCard(
          imagen: pais.imagen ?? '',
          nombre: pais.nombre,
        );
      },
    );
  }
}

class PaisCard extends StatelessWidget {

  const PaisCard({
    super.key,
    required this.imagen,
    required this.nombre,
  });

  final String imagen;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    // TO-DO
    // Devuelve un widget de tipo Card, con el diseño que desees, pero
    // que muestre la imagen  (obtenida de Internet a partir de la url)
    // y el nombre del país.
   return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      elevation: 4,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(imagen),
              ),
            ],
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              nombre
            ),
          ),
        ],
      ),
    );
  }
}
