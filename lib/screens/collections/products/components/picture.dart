import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gymjibi/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Picture extends StatefulWidget {
  final List<String> image;

  const Picture({super.key, required this.image});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width / 2;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              viewportFraction: 1,
              //enableInfiniteScroll: false,
              //enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              height: height,
              autoPlay: true,
              autoPlayInterval: const Duration(milliseconds: 4000),
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index)),
          itemCount: widget.image.length,
          itemBuilder: (context, index, realIndex) {
            return img(index);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: indicator(),
        ),
      ],
    );
  }

  Widget indicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.image.length,
        effect: ScrollingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          dotColor: ccb,
          activeDotColor: black,
          //fixedCenter: true
        ),
      );

  Widget img(int index) {
    String encodedUrl = Uri.encodeFull(widget.image[index]);
    encodedUrl = encodedUrl.replaceFirst("http://", "https://");
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          encodedUrl,
          width: MediaQuery.of(context).
          size.width - 40,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print(" error: $error");
            print(" ادرس اصلی تصویر ${widget.image[index]}");
            print(" ادرس encode تصویر $encodedUrl");
            return Column(
              children: [
                Text(" خطایی در نمایش تصویر رخ داده است",style: bodyXL,),
              ],
            );
          },
        )

/*    Image(
      width: MediaQuery.of(context).size.width - 40,
      fit: BoxFit.cover,
      image: NetworkImage(
          widget.image[index]),
      errorBuilder: (context, error, stackTrace) {
        String encodedUrl = Uri.encodeFull(widget.image[index]);
        encodedUrl = encodedUrl.replaceFirst("http://", "https://");
        return Image.network(encodedUrl);
      },
    ),*/

        );
  }
}
