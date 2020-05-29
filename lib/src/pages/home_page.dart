import 'package:components_app/src/providers/menu.dart';
import 'package:components_app/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes'),),
      body: _lista(),
    );
  }

  Widget _lista(){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listaItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data){
    final List<Widget> opciones = [];

    data.forEach((element) {
      final tileTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.red),
        onTap: (){},
      );
      opciones.add(tileTemp);
      opciones.add(Divider());
    });
    return opciones;
    
  }


}