// Define el repositorio de acceso a los datos
// Esta capa es la que se usa desde la aplicación para abstraer
// el acceso a los datos.
// Hemos cambiado el repositorio. 
// Ahora en vez de obtenerlo de la clase PaisesApi lo obtenemos de PaisesEjemplo


import 'package:paisesgui/data/services/paises_ejemplo.dart';
import 'package:paisesgui/domain/entities/continente.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class PaisesRepository {
  // Con late indicamos que este valor 
  // se inicializar posteriormente (en el constructor)
  late PaisesEjemplo api;

  PaisesRepository() {
    api = PaisesEjemplo();
  }

  List<Continente> getContinentes() {

    // Opción 2. Hacer uso del mapeado de estructuras
    // La función .map nos devuelve un Iterable, por lo que
    // lo hemos de convertir a lista con toList().
    return (api.getContinentes()).map((continente) {
      return Continente.fromJSON(continente);
    }).toList();
  }

  // TO-DO:
  // Implementar el método getPaises
  List<Pais> getPaises(){
    return (api.getPaises()).map((pais) {
      return Pais.fromJSON(pais);
    }).toList();
  
  }    

  // TO-DO:
  // Implementar el método infoPais
  Pais infoPais() {
    return Pais.fromJSON(api.infoPais());
  }

}
