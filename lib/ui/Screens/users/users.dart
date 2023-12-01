


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva_parapente/bloc/estadoPago/estadopago_bloc.dart';
import 'package:reserva_parapente/modelo/estadopagoModelo.dart';
import 'package:reserva_parapente/repository/EstadopagoRepositoty.dart';
import 'package:reserva_parapente/ui/Screens/users/createUser.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

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
                            builder: (context) => CreateUser()));
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
            MyForm(),
          ],
        ),
      ),
    );
  }
}





class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  // Variables para almacenar datos del formulario
  String _nombre = '';
  String _correoElectronico = '';
  String _rol = '';
  String _estado = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu nombre';
                }
                return null;
              },
              onSaved: (value) {
                _nombre = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu correo electrónico';
                }
                return null;
              },
              onSaved: (value) {
                _correoElectronico = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Rol'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu rol';
                }
                return null;
              },
              onSaved: (value) {
                _rol = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Estado'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu estado';
                }
                return null;
              },
              onSaved: (value) {
                _estado = value!;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Guardar los datos del formulario
                    _formKey.currentState!.save();
                    // Aquí puedes hacer algo con los datos, como enviarlos a un servidor
                    // o almacenarlos localmente.
                    // En este ejemplo, solo imprimimos los datos.
                    print('Nombre: $_nombre');
                    print('Correo Electrónico: $_correoElectronico');
                    print('Rol: $_rol');
                    print('Estado: $_estado');
                  }
                },
                child: Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}