// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reserva_parapente/ui/Dashboard/dahboardScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Fly Universal',
                        style: TextStyle(
                          color: Color(0xFF363939),
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Correo',
                            style: TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFFF1F4FF), // Color del borde
                                width: 1.0, // Ancho del borde
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 55,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Color(0xFF9098B1),
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xFF9098B1),
                                  ),
                                  hintText: 'example@gmail.com',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9098B1),
                                  )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Contraseña',
                            style: TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFF1F4FF), // Color del borde
                                width: 1.0, // Ancho del borde
                              ),
                            ),
                            height: 55,
                            child: TextField(
                              obscureText: true,
                              style: TextStyle(
                                color: Color(0xFF9098B1),
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xFF9098B1),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9098B1),
                                  )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => print("Forgot password"),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Color(0XFF0961F5),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF0961F5).withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                Color(0xFF0961F5), // Color de fondo del botón
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(100), // Radio al borde
                            ),
                          ),
                          child: Text(
                            'Acceder',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Color(0xFFF1F4FF),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'o',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Color(0xFFF1F4FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () => print('login'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // Color de fondo del botón
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Radio al borde
                              side: BorderSide(
                                color: Color(0xFFF1F4FF), // Color del borde
                                width: 1, // Ancho del borde
                              ),
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          child: Text(
                            'Google',
                            style: TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
