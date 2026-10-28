import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/continente.dart';

/* Pantalla ContinentesScreen: muestra cinco CircleAvatar con los distintos continentes */

class ContinentesScreen extends StatelessWidget {
  ContinentesScreen({super.key});

  // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura de la pantalla Material Design
      body: Center(
        // Centramos el contenido
        child: SingleChildScrollView(
          // Contenedor con scroll por si nos salimos del espacio disponible
          child: Column(
            // Organizamos los continentes en forma de columna
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: // Obtendremos la lista de widgets con los continentes con la
                // función privada _creaListaContinentes.
                _creaListaContinentes(_repository.getContinentes()),
          ),
        ),
      ),
    );
  }
}

List<Widget> _creaListaContinentes(List<Continente> listaContinentes) {
  // Devolveremos una lista de widgets
  List<Widget> listaWidgets = [];

  // Recorremos la lista de continentes
  for (Continente continente in listaContinentes) {
    listaWidgets.add(
      // Y añadimos a la lista un widget personalizado de tipo ContinenteRoundButton
      ContinenteRoundButton(
        nombre: continente.nombre,
        imagen: continente.imagen ?? "",
      ),
    );
    listaWidgets.add(
      const SizedBox(height: 20),
    ); // Añadimos un espacio después del widget con el continente
  }
  return listaWidgets;
}

class ContinenteRoundButton extends StatelessWidget {
  const ContinenteRoundButton({
    required this.imagen,
    required this.nombre,
    super.key,
  });

  final String imagen;
  final String nombre;

  @override
  Widget build(BuildContext context) 
  {
    return  CircleAvatar(
          radius: 110,
          backgroundImage: NetworkImage(imagen),
          child: Text(
            nombre,
            style: Theme.of(context).textTheme.displayMedium
          ),
          );
  }
}
