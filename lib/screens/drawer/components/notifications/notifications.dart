import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image(
            fit: BoxFit.cover,

            alignment: Alignment.center,
            image: AssetImage(
              "assets/images/dashbord/notifications/notifications.png",
            ),
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
