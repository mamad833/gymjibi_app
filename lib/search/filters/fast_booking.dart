import 'package:flutter/material.dart';
import 'package:gymjibi/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Fast_booking extends StatefulWidget {
  @override
  bool deletefilters = false;
  Fast_booking({required this.deletefilters});
  State<Fast_booking> createState() => _Fast_bookingState();
}

class _Fast_bookingState extends State<Fast_booking> {

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                  });
                },
                child: Text(
                  "رزرو سریع",
                  style: bodyXL,
                )),

            Container(
              child: FlutterSwitch(
                width: 42,
                height: 25,
                activeColor: cMain,
                inactiveColor: c75,
                toggleSize: 16,
                value: status,
                borderRadius: 100,
                //padding: 10,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
