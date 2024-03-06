import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Center(child: Text("bb")),
                  ),
                  Container(
                    height: 58,
                    //height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Center(child: Text("bb")),
                  ),
                  Container(
                    height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Center(child: Text("bb")),
                  ),
                  Container(
                    height: 58,
                    width: width/4-13,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Center(child: Text("---",style: bodyLG,)),
                  ),
                ],
              ),
              SizedBox(height: 4,),
            ],
          );
        },
      ),
    );

  }
}
