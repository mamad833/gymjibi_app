import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gymjibi/constants.dart';
import 'package:gymjibi/ratingbar.dart';

class Comments extends StatefulWidget {

  final String username;
  final String userprofile;
  final double rating;
  final String body;
  final String postedAt;


  const Comments({Key? key, required this.userprofile, required this.rating, required this.username, required this.body,required this.postedAt}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 50,
                  height: 50,
                  child: widget.userprofile.isNotEmpty? ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network(widget.userprofile,fit: BoxFit.cover))
                      : SvgPicture.asset("assets/icons/profile.svg",)
              ),
              SizedBox(width: 8,),
              SizedBox(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: bodyXL,
                    ),
                    Text(
                      widget.postedAt,
                      style: bodyXS,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "امتیاز",
                        style: bodyXS,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.rating.toString(),
                        style: h3,
                      ),
                    ],
                  ),
                  Rating(rating: widget.rating,),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 0.5,
            color: cde,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              widget.body,
              style: bodyXS,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
