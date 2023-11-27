import 'package:flutter/material.dart';
import 'package:reserva_parapente/modelo/packageModel.dart';
import 'package:reserva_parapente/services/paqueteService.dart';

class PaqueteScreen extends StatefulWidget {
  const PaqueteScreen({super.key});

  @override
  State<PaqueteScreen> createState() => _PaqueteScreenState();
}

class _PaqueteScreenState extends State<PaqueteScreen> {
  final ApiProvider api = ApiProvider();
  late List<PaqueteDeVuelo> paquetes = [];
  @override
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getPaquetesDeVuelo();
  }

  Future<void> _getPaquetesDeVuelo() async {
    setState(() {
      isLoading = true;
    });

    try {
      final List<PaqueteDeVuelo> fetchedPaquetes =
          await api.fetchPaquetesDeVuelo();
      setState(() {
        paquetes = fetchedPaquetes;
        isLoading = false;
      });
    } catch (e) {
      // Manejo de errores
      isLoading = false;
    }
  }

  Future<void> _eliminarPaquete(int? id) async {
    if (id != null) {
      try {
        await api.eliminarPaquete(id);
        setState(() {
          paquetes.removeWhere((element) => element.id == id);
        });
      } catch (e) {
        // Manejo de errores
      }
    }
  }

  Future<void> _refreshPaquetes() async {
    await _getPaquetesDeVuelo();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshPaquetes,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: paquetes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: paquetes[index].urlImagen != null
                        ? Image.network(
                            paquetes[index].urlImagen!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Placeholder(
                            fallbackHeight: 50,
                            fallbackWidth: 50,
                          ),
                    title: Text(paquetes[index].nombrePaquete),
                    subtitle: Text(paquetes[index].descripcion),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // IconButton(
                        //   icon: Icon(Icons.edit),
                        //   onPressed: () async {
                        //     final resultado = await Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) =>
                        //             EditarPaqueteScreen(paquete: paquetes[index]),
                        //       ),
                        //     );

                        //     if (resultado != null && resultado as bool) {
                        //       _getPaquetesDeVuelo(); // Actualiza la lista después de editar el paquete
                        //     }
                        //   },
                        // ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Eliminar Paquete'),
                                  content: Text(
                                      '¿Estás seguro de eliminar este paquete?'),
                                  actions: [
                                    TextButton(
                                      child: Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Eliminar'),
                                      onPressed: () {
                                        _eliminarPaquete(paquetes[index].id);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         PaqueteDetailsScreen(paquete: paquetes[index]),
                      //   ),
                      // );
                    },
                  );
                },
              ),
            ),
    );
  }
}
