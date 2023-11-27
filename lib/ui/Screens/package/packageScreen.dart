import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reserva_parapente/bloc/paquete/paquete_bloc.dart';
import 'package:reserva_parapente/repository/PaqueteRepository.dart';
import 'package:reserva_parapente/ui/Screens/package/createPackage.dart';
import 'package:reserva_parapente/ui/Screens/package/paqueteScreen.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaqueteBloc(PaqueteRepository()),
      child: PackageContent(),
    );
  }
} 

class PackageContent extends StatefulWidget {
  const PackageContent({super.key});

  @override
  State<PackageContent> createState() => _PackageContentState();
}

class _PackageContentState extends State<PackageContent> {
  @override
  void initState() {
    super.initState();
    context.read<PaqueteBloc>().add(ListPaqueteEvent());
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
                  'Paquetes',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF243465),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreatePackage())
                    );
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
              // padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
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
              child: PaqueteScreen(),
            )
          ],
        ),
      ),
    );
  }
}
