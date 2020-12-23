import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ListadoProvider{
    List<dynamic> opciones = [];
    _ListadoProvider(){
     // cargarLista();
    }
    
    Future<List<dynamic>> cargarLista() async { 
        final resp = await rootBundle.loadString("data/menu_opts.json");
        Map mapData= json.decode(resp);
        opciones = mapData['rutas'];
        return opciones;
    }

}

final listadoProvider= new _ListadoProvider();