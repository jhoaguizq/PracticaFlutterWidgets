

import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/widgets/my_weather_info.dart';

class InfoPaisDetalle extends StatelessWidget {
  InfoPaisDetalle({
    super.key,
  });

    // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {
    Pais pais = _repository.infoPais();

    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Población (num. de habitantes), latitud y longitud.
    // Podéis combinar Column y Row para mostrar la información tabulada
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Información del país'),
      ),
      body: SingleChildScrollView
      (
        child:Column
        (
          children:
          [
            MyWeatherInfo(),
            Text
            (
              'Población: "${pais.poblacion}"',
            ),
            Text
            (
              'Latitud: "${pais.latitud}"',
            ),
            Text
            (
              'Longitud: "${pais.longitud}"',
            )
          ]
        )
      )
    );
  }
}
