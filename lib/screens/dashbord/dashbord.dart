import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/screens/drawer/drawer.dart';
import 'package:gymjibi/navigation.dart';
import 'package:gymjibi/screens/dashbord/components/profile.dart';

import '../../constants.dart';

class Dashbord extends StatefulWidget{




  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {


      @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      backgroundColor: cf9,
      bottomNavigationBar: BottomNavBar(index: 4,),
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.transparent,
        elevation:0,
        leading: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child:SvgPicture.asset("assets/icons/menu.svg",color:black ),
                ),
              );
            }
        ),
        title: Row(
          children: [
            Profile(urlImage: null,nameUser: "mgh"),
          ],
        ),
      ),
      drawer: Drawer1(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        child: ListView(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
            SizedBox(height: 50,)
          ],
        ),
      ),

    );
  }
}

