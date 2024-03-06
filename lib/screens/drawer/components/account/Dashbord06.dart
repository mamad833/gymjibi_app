import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as Get;
import 'package:get/get_core/src/get_main.dart';

import 'package:gymjibi/constants.dart';
import 'package:gymjibi/data/profile_user_api/bloc/state/profile_user_state.dart';
import 'package:gymjibi/screens/drawer/components/account/account.dart';
import 'package:gymjibi/screens/drawer/components/main_dashbord/Dashbord01.dart';
import 'package:gymjibi/screens/drawer/drawer.dart';
import 'package:gymjibi/navigation.dart';

import '../../../../data/profile_user_api/bloc/view_model/panel_user_view_model.dart';
import '../../../dashbord/components/profile.dart';

class Dashbord06 extends StatefulWidget {
  @override
  State<Dashbord06> createState() => _Dashbord06State();
}

class _Dashbord06State extends State<Dashbord06> {
  final getProfile = GetPanelUserViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile.getProfileUser();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // برگرداندن به صفحه خانه
        Get.Get.offAll(
          Dashbord01.new,
        );
        return true;
      },
      child: BlocBuilder(
          bloc: getProfile,
          builder: (context, state) {
            if (state is ProfileUserLoadingState) {
              return Container(
                color: Colors.red,
              );
            }
            if (state is ProfileUserSuccessState) {
              return Scaffold(
                extendBody: true,
                backgroundColor: cf9,
                bottomNavigationBar: BottomNavBar(
                  index: 4,
                ),
                appBar: AppBar(
                  toolbarHeight: 130,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: SvgPicture.asset("assets/icons/menu.svg",
                            color: black),
                      ),
                    );
                  }),
                  title: Row(
                    children: [
                      Profile(
                        urlImage: state.response.profile ?? "",
                        nameUser: state.response.fullname ?? "",
                      ),
                    ],
                  ),
                ),
                drawer: Drawer1(btn: 6),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اطلاعات حساب کاربری",
                        style: h4,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Account(),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              );
            }
            if (state is ProfileUserFailedState) {
              return Container(
                color: Colors.green,
              );
            }
            return SizedBox();
          }),
    );
  }
}
