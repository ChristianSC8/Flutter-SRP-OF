import 'package:flutter/material.dart';

class CreateUser extends StatelessWidget {
  const CreateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NewUserForm(),
    );
  }
}

class NewUserForm extends StatefulWidget {
  @override
  _NewUserFormState createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedRole = 'user';
  String _selectedStatus = 'activo';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Correo Electrónico'),
            keyboardType: TextInputType.emailAddress,
          ),
          DropdownButtonFormField<String>(
            value: _selectedRole,
            onChanged: (value) {
              setState(() {
                _selectedRole = value!;
              });
            },
            items: ['admin', 'user']
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            decoration: InputDecoration(labelText: 'Rol'),
          ),
          DropdownButtonFormField<String>(
            value: _selectedStatus,
            onChanged: (value) {
              setState(() {
                _selectedStatus = value!;
              });
            },
            items: ['activo', 'inactivo']
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            decoration: InputDecoration(labelText: 'Estado'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes manejar la lógica para guardar el nuevo usuario
              // y enviar los datos a donde sea necesario.
              print('Nombre: ${_nameController.text}');
              print('Correo Electrónico: ${_emailController.text}');
              print('Rol: $_selectedRole');
              print('Estado: $_selectedStatus');
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
