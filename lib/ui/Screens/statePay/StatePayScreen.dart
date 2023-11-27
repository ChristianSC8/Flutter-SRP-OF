import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva_parapente/bloc/estadoPago/estadopago_bloc.dart';
import 'package:reserva_parapente/modelo/estadopagoModelo.dart';
import 'package:reserva_parapente/repository/EstadopagoRepositoty.dart';
import 'package:reserva_parapente/ui/Screens/statePay/CreateStatePay.dart';

class StatePayScreen extends StatelessWidget {
  const StatePayScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return BlocProvider(
      create: (context) => EstadopagoBloc(EstadoPagoRepository()),
      child: StatePayConten(),
    );
  }
}

class StatePayConten extends StatefulWidget {
  const StatePayConten({super.key});

  @override
  State<StatePayConten> createState() => _StatePayContenState();
}

class _StatePayContenState extends State<StatePayConten> {
  @override
  void initState() {
    super.initState();
    context.read<EstadopagoBloc>().add(ListEstadopagoEvent());
  }

  Future<void> modalDelete(EstadopagoModelo estadopago) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text('Eliminar Usuario'),
          content: Text('¿Seguro que deseas eliminar a ${estadopago.nombre}?'),
          actionsPadding: EdgeInsets.only(bottom: 8.0),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Eliminar',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                deleteUser(estadopago);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
   void deleteUser(EstadopagoModelo estadopago) {
    context.read<EstadopagoBloc>().add(DeleteEstadopagoEvent(estadopago));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(0,10,0,10),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      // color: Color(0xFFF2F8FF),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Color(0xFFF1F4FF),
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/back.svg',
                        height: 25,
                        width: 25,
                        color: Color(0xFF9DA8C3),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Estados de pago',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF243465),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePayContent()));
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      // color: Color(0xFFF2F8FF),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Color(0xFFF1F4FF),
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/add.svg',
                        height: 20,
                        width: 20,
                        color: Color(0xFF9DA8C3),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Container(
              child: TextField(
                style: TextStyle(
                  color: Color(0xFF848A9C),
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xFFF1F4FF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xFF9DA8C3)),
                  ),
                  hintText: "Buscar",
                  hintStyle: TextStyle(
                    color: Color(0xFF848A9C),
                    decoration: TextDecoration.none,
                    fontSize: 18,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 13.0),
                  prefixIcon: Icon(Icons.search, size: 35),
                  prefixIconColor: Color(0xFF9DA8C3),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<EstadopagoBloc, EstadopagoState>(
                builder: (context, state) {
                  if (state is EstadopagoLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is EstadopagoLoadedState) {
                    final statePayList = state.EstadopagoList;
                    return statePayList.isEmpty
                        ? Center(
                            child: Text('No hay estados de pago disponibles.'))
                        : Container(
                            margin: EdgeInsets.all(0), // Ajusta el margen aquí
                            padding:
                                EdgeInsets.all(0), // Ajusta el padding aquí
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: statePayList.length,
                              itemBuilder: (context, index) {
                                final statePay = statePayList[index];
                                return Container(
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.all(0),
                                  child: ListTile(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    title: Text(
                                      statePay.nombre,
                                      style: TextStyle(
                                        color: Color(0xFF243465),
                                        fontSize: 20,
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.edit,
                                              color: Color(0xFF848A9C)),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.delete,
                                              color: Color(0xFF848A9C)),
                                          onPressed: () {
                                            modalDelete(statePay);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  } else if (state is EstadopagoError) {
                    return Center(child: Text('Error: ${state.e.toString()}'));
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
