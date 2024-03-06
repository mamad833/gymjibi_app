import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../weblog.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(

          child: Image(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            image: AssetImage(
              "assets/images/home/footer.png",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 260),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Weblog(),
            ],
          ),
        ),
      ],
    );

  }
}
