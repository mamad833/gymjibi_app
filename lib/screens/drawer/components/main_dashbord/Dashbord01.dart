import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/data/profile_user_api/bloc/state/profile_user_state.dart';
import 'package:gymjibi/screens/drawer/components/main_dashbord/components/recent_activities.dart';
import 'package:gymjibi/screens/drawer/components/main_dashbord/components/statistics.dart';
import 'package:gymjibi/screens/drawer/drawer.dart';
import 'package:gymjibi/navigation.dart';
import 'package:gymjibi/screens/home/home_screen.dart';

import '../../../../data/profile_user_api/bloc/view_model/panel_user_view_model.dart';
import '../../../dashbord/components/profile.dart';

class Dashbord01 extends StatefulWidget {
  @override
  State<Dashbord01> createState() => _Dashbord01State();
}

class _Dashbord01State extends State<Dashbord01> {
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
        Get.offAll(
          Homescreen.new,
        );
        return true;
      },
      child: BlocBuilder(
        bloc: getProfile,
        builder: (context, state) {
          if (state is ProfileUserLoadingState) {
            return Scaffold(
              body: CircularProgressIndicator(),
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
                      nameUser: state.response.fullname,
                      urlImage: state.response.profile,
                    ),
                  ],
                ),
              ),
              drawer: Drawer1(btn: 1),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Statistics(
                      booked: state.response.bookedsCount ?? 0,
                      favorite: state.response.favoritesCount ?? 0,
                      comment: state.response.commentsCount ?? 0,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "فعالیت های اخیر",
                      style: h4,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    RecentActivities(),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            );
          }
          if (state is ProfileUserFailedState) {}
          return SizedBox();
        },
      ),
    );
  }
}
