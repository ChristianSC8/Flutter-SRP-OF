import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateReservationsScreen extends StatelessWidget {
  const CreateReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CreateReservationsContent(),
    );
  }
}

class CreateReservationsContent extends StatefulWidget {
  const CreateReservationsContent({super.key});

  @override
  State<CreateReservationsContent> createState() =>
      _CreateReservationsContentState();
}

class _CreateReservationsContentState extends State<CreateReservationsContent> {
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
                  width: 50,
                ),
                Text(
                  'Nuevo estado de pago',
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
                    style: TextStyle(fontSize: 18, color: Color(0xFF243465)),
                  ),
                  TextField(
                    // controller: nameController,
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
                  Text(
                    'Descripcion',
                    style: TextStyle(fontSize: 18, color: Color(0xFF243465)),
                  ),
                  TextField(
                    // controller: drescripController,
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
                              // createStatePay();
                              Navigator.pop(context);
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
