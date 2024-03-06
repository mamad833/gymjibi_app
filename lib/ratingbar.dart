import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Rating extends StatefulWidget {
  final double rating;
  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {

      return Container(
        child:

        RatingBarIndicator(
          rating: widget.rating,
          itemCount: 5,
          itemSize: 20,

          // glow: false,
          // ignoreGestures: true,
          // minRating: 0.1,
          // glowRadius: 0,
          // allowHalfRating: true,
          // initialRating: 1.6,
          // updateOnDrag: true,

          itemBuilder: (context, _) => Icon(Icons.star_rounded,color: Color(0xffFFED01),),
          /*onRatingUpdate:(v) {
            //
            // setState(() {
            //   //value = v;
            // });
          },*/
        ),


      );
    }
  }

