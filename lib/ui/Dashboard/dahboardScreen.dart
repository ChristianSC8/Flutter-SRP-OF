import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva_parapente/ui/Screens/Reservations/ReservationScreen.dart';
import 'package:reserva_parapente/ui/Screens/formPayment/formPayScreen.dart';
import 'package:reserva_parapente/ui/Screens/package/packageScreen.dart';
import 'package:reserva_parapente/ui/Screens/reports/reportScreen.dart';
import 'package:reserva_parapente/ui/Screens/statePay/StatePayScreen.dart';
import 'package:reserva_parapente/ui/Screens/users/users.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 190,
            color: Color(0xFF2048FF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: 20, top: 10, right: 10, bottom: 0),
                    height: 100,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Buenos Dias'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Christian Givani',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Row(
                          children: [
                            Container(
                                // Add botton option of email or notification
                                ),
                            Container(
                              child: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0Xffffffff),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Buscar",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 18,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical:
                              13.0), // Ajusta este valor para centrar verticalmente el texto
                      prefixIcon: Icon(Icons.search, size: 35),
                      prefixIconColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5,),
          Container(
            width: double.infinity,
            height: 80,
            child: OptionDrawerLink(),
          ),
          const SizedBox(height: 5,),
          Container(
            padding: EdgeInsets.only(left: 20, top: 0, bottom: 0 ,right: 20),
            width: double.infinity,
            height: 70,
            // color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF356AFF), Color(0xFF239FFF)],
                ),
              ),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, top: 0, bottom: 0 ,right: 0),
                  // color: Colors.lightGreen,
                  width: 180,
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white30
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/usd.svg',
                            width: 25,
                            height: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ganancias'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                          ),
                          Text('S/.510.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(flex: 1,),
                Container(
                  width: 3,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white30,
                  ),
                ),
                Spacer(flex: 1,),
                Container(
                  padding: EdgeInsets.only(left: 12, top: 0, bottom: 0 ,right: 0),
                  // color: Colors.lightGreen,
                  width: 180,
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white30
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/calend.svg',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hoy'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                          ),
                          Text('14 Reservas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
            ),
          )
        ],
      ),
    );
  }
}





class OptionDrawerLink extends StatelessWidget {
  const OptionDrawerLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          
          Container(
            width: 160,
            height:double.infinity,
            // color: Colors.cyan,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 0, bottom: 0 ,right: 15),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF6F8FB), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      // color: Colors.amber,
                      child: SvgPicture.asset('assets/reserve.svg',
                      color: Color(0xFF235DFF),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Reserva',
                      style: TextStyle(
                        color: Color(0xFF1B1446),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 160,
            height:double.infinity,
            // color: Colors.cyan,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 0, bottom: 0 ,right: 15),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF6F8FB), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      // color: Colors.amber,
                      child: SvgPicture.asset('assets/caja.svg',
                      color: Color(0xFF235DFF),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Paquetes',
                      style: TextStyle(
                        color: Color(0xFF1B1446),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 160,
            height:double.infinity,
            // color: Colors.cyan,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 0, bottom: 0 ,right: 15),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF6F8FB), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      // color: Colors.amber,
                      child: SvgPicture.asset('assets/cheque.svg',
                      color: Color(0xFF235DFF),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Cuentas',
                      style: TextStyle(
                        color: Color(0xFF1B1446),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 180,
            height:double.infinity,
            // color: Colors.cyan,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 0, bottom: 0 ,right: 15),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF6F8FB), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      // color: Colors.amber,
                      child: SvgPicture.asset('assets/veri.svg',
                      color: Color(0xFF235DFF),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Estado pago',
                      style: TextStyle(
                        color: Color(0xFF1B1446),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 160,
            height:double.infinity,
            // color: Colors.cyan,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 0, bottom: 0 ,right: 15),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF6F8FB), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      // color: Colors.amber,
                      child: SvgPicture.asset('assets/reserve.svg',
                      color: Color(0xFF235DFF),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Reserva',
                      style: TextStyle(
                        color: Color(0xFF1B1446),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 160,
            height:double.infinity,
            // color: Colors.cyan,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 0, bottom: 0 ,right: 15),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF6F8FB), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      // color: Colors.amber,
                      child: SvgPicture.asset('assets/reserve.svg',
                      color: Color(0xFF235DFF),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Reserva',
                      style: TextStyle(
                        color: Color(0xFF1B1446),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
        width: 360,
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFC4C8D3),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: Color(0xFFC4C8D3),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Christian Giovani',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF243465),
                          ),
                        ),
                        Text(
                          'Administrador',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF848A9C),
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                    GestureDetector(
                      onTap: () {
                        // Cerrar el drawer
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        height: 35,
                        width: 35,
                        child: SvgPicture.asset(
                          'assets/close.svg',
                          width: 30,
                          height: 30,
                          color: Color(0xFF243465),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ListOptions(),
              Spacer(
                flex: 1,
              ),
              ListOptionBotton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListOptions extends StatelessWidget {
  const ListOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
          contentPadding: EdgeInsets.only(left: 0),
          leading: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              'assets/dashboard.svg',
              color: Color(0xFF243465),
            ),
          ),
          title: Text(
            'Dashboard',
            style: TextStyle(
              color: Color(0xFF243465),
              fontSize: 18,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PackageScreen()));
          },
          contentPadding: EdgeInsets.only(left: 0),
          leading: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              'assets/reserv.svg',
              color: Color(0xFF243465),
            ),
          ),
          title: Text(
            'Paquetes',
            style: TextStyle(
              color: Color(0xFF243465),
              fontSize: 18,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReservationsScreen(),
              ),
            );
          },
          contentPadding: EdgeInsets.only(left: 0),
          leading: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              'assets/date.svg',
              color: Color(0xFF243465),
            ),
          ),
          title: Text(
            'Reservas',
            style: TextStyle(
              color: Color(0xFF243465),
              fontSize: 18,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FormPayScreen()));
          },
          contentPadding: EdgeInsets.only(left: 0),
          leading: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              'assets/account.svg',
              color: Color(0xFF243465),
            ),
          ),
          title: Text(
            'Cuentas',
            style: TextStyle(
              color: Color(0xFF243465),
              fontSize: 18,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StatePayScreen()));
          },
          contentPadding: EdgeInsets.only(left: 0),
          leading: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              'assets/state.svg',
              color: Color(0xFF243465),
            ),
          ),
          title: Text(
            'Estado pago',
            style: TextStyle(
              color: Color(0xFF243465),
              fontSize: 18,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
          },
          contentPadding: EdgeInsets.only(left: 0),
          leading: SizedBox(
            height: 28,
            width: 28, 
            child: SvgPicture.asset(
              'assets/user.svg',
              color: Color(0xFF243465),
            ),
          ),
          title: Text(
            'Usuarios',
            style: TextStyle(
              color: Color(0xFF243465),
              fontSize: 18,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BarChartSample2()));
          },
          contentPadding: EdgeInsets.only(left: 0),
          leading: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              'assets/report.svg',
              color: Color(0xFF243465),
            ),
          ),
          title: Text(
            'Reportes',
            style: TextStyle(
              color: Color(0xFF243465),
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class ListOptionBotton extends StatelessWidget {
  const ListOptionBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          // Agrega la lógica que necesites al hacer clic en el ListTile
        },
        contentPadding: EdgeInsets.only(left: 0),
        leading: SizedBox(
          height: 28,
          width: 28,
          child: SvgPicture.asset(
            'assets/logout.svg',
            color: Color(0xFF243465),
          ),
        ),
        title: Text(
          'Cerrar sesion',
          style: TextStyle(
            color: Color(0xFF243465),
            fontSize: 18,
          ),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Agrega la lógica que deseas al hacer clic en el botón
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent, // Fondo transparente
            shadowColor: Colors.transparent, // Sombra transparente
          ),
          child: Icon(
            Icons.sunny, // Icono de flecha hacia adelante
            color: Color(0xFF243465),
          ),
        ),
      ),
    );
  }
}
