import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CreatePackage extends StatefulWidget {
  const CreatePackage({super.key});

  @override
  State<CreatePackage> createState() => _CreatePackageState();
}

class _CreatePackageState extends State<CreatePackage> {
   final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController duracionController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        print('hola mundo');
        print( _image );
      });
    }
  }

  Future<void> createPackage(BuildContext context) async {

    var url = Uri.parse('http://192.168.1.105:5000/paquetes'); // Reemplaza con la URL de tu backend

    var request = http.MultipartRequest('POST', url);
    request.fields['nombre_paquete'] = nombreController.text;
    request.fields['descripcion'] = descripcionController.text;
    request.fields['duracion'] = duracionController.text;
    request.fields['precio'] = precioController.text;
    request.fields['estado'] = estadoController.text;

    if (_image != null) {
      request.files.add(
        http.MultipartFile(
          'imagen',
          _image!.readAsBytes().asStream(),
          _image!.lengthSync(),
          filename: _image!.path.split('/').last,
        ),
      );
    }
    Navigator.of(context).pop();


    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {

      // El paquete se ha creado exitosamente
      // Navegar a la pantalla de listado de paquetes y pasar el nuevo paquete

    } else {
      // Hubo un error al crear el paquete
      // Puedes mostrar un mensaje de error o realizar alguna acción
    }
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const SizedBox(
                  width: 90,
                ),
                Text(
                  'Nuevo paquete',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF243465),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    'Nombre',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF243465),
                    ),
                  ),
                  TextField(
                    controller: nombreController,
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
                      hintText: "",
                      hintStyle: TextStyle(
                          color: Color(0xFF848A9C),
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal:
                              16.0), // Ajusta estos valores según tus necesidades
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Precio',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF243465),
                            ),
                          ),
                          Container(
                            width: 175, // Ajusta el ancho según tus necesidades
                            child: TextField(
                              controller: precioController,
                              style: TextStyle(
                                color: Color(0xFF848A9C),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFFF1F4FF)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFF9DA8C3)),
                                ),
                                hintText: "",
                                hintStyle: TextStyle(
                                  color: Color(0xFF848A9C),
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14.0,
                                  horizontal: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tiempo',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF243465),
                            ),
                          ),
                          Container(
                            width: 175, // Ajusta el ancho según tus necesidades
                            child: TextField(
                              controller: duracionController,
                              style: TextStyle(
                                color: Color(0xFF848A9C),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFFF1F4FF)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFF9DA8C3)),
                                ),
                                hintText: "Tiempo",
                                hintStyle: TextStyle(
                                  color: Color(0xFF848A9C),
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14.0,
                                  horizontal: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Descripcion',
                    style: TextStyle(fontSize: 18, color: Color(0xFF243465)),
                  ),
                  TextField(
                    controller: descripcionController,
                    style: TextStyle(
                      color: Color(0xFF848A9C),
                    ),
                    maxLines: 3,
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
                      hintText: "",
                      hintStyle: TextStyle(
                        color: Color(0xFF848A9C),
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Imagen',
                    style: TextStyle(fontSize: 18, color: Color(0xFF243465)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 260,
                    // color: Colors.amber,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border:
                              Border.all(width: 1, color: Color(0xFFF1F4FF))),
                      child: _image != null ? Image.file(_image!, fit: BoxFit.cover) : Text('No se ha seleccionado ninguna imagen'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: Center(
                    child: Container(
                      width: 230,
                      height: 50,
                      // color: Colors.lightBlue,
                      child: ElevatedButton(
                          onPressed: _getImage,
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0961F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // padding: EdgeInsets.symmetric(
                            //     vertical: 8, horizontal: 30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                // color: Colors.green,
                                child: SvgPicture.asset(
                                  'assets/img.svg',
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('Selecionar img',
                                style: TextStyle(
                                  fontSize: 18, 
                                  color: Color(0xFFFFFFFF)
                                )
                              )
                            ],
                          )
                        ),
                      ),
                    )
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 52,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              // onPrimary: Color(0xFF243465),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color: Color(0xFFC4C8D3),
                                    width: 1), // Añade el borde
                              ),
                              elevation: 0, // Quita la sombra
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                color: Color(0xFF848A9C),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              createPackage(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0961F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              'Guardar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
