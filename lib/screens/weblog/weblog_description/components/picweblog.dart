
import 'package:flutter/material.dart';


class PicWeblog extends StatefulWidget {
  @override
  State<PicWeblog> createState() => _PicWeblogState();
}

class _PicWeblogState extends State<PicWeblog> {
  int activeindex=0;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image(
          width: MediaQuery.of(context).size.width-40,
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/home/test/weblog.png",
          ),
        ),
      ),
    );
  }

}


