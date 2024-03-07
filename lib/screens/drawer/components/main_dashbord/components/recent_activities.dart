import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gymjibi/constants.dart';

import '../../../../../data/get_bookedes_user/bloc/state/get_bookeds_user_state.dart';
import '../../../../../data/get_bookedes_user/bloc/view_model/get_bookeds_user_view_model.dart';

class RecentActivities extends StatefulWidget {
  RecentActivities({Key? key}) : super(key: key);

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  final getLsBooked = GetBookedUserViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLsBooked.getBookedUser();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder(
      bloc: getLsBooked,
      builder: (context, state) {
        if (state is GetBookedsLoadingState) {
          return CircularProgressIndicator();
        }
        if (state is GetBookedsSuccessState) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.response.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/home/test/paint.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "رزرو مجموعه",
                                      style: h5,
                                    ),
                                    Text(
                                      state.response[index].gym!.name!,
                                      style: bodyXS,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "وضعیت : ",
                                  style: bodyXS,
                                ),
                                Text(
                                  state.response[index].status=="accepted"?"تایید شده":state.response[index].status=="requested"?"در انتطار تایید":"لغو شده",
                                  style: h5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
