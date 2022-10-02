import 'package:flutter/material.dart';

import '../../core/utils/constant.dart';
import '../../domain/entity/movie.dart';
class MySliderItem extends StatelessWidget {


  const MySliderItem({Key? key, required this.movie, required this.bottomSpace,required this.fit}) : super(key: key);
  final double bottomSpace;
  final Movie movie;
  final StackFit fit;


  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: fit,
      children: [
        Container(
          foregroundDecoration:
          BoxDecoration(gradient: mySliderLinearGradient()),
          child: Image.network(
            "${ApiConstants.baseImageUrl}${movie.backdropPath}",
          ),
        ),
        Positioned(
            left: 12,
            bottom: bottomSpace,
            child: Text(
              movie.name,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  LinearGradient mySliderLinearGradient() {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.center,
      colors: [
        ColorConstants.primary,
        ColorConstants.primary.withOpacity(0.5),
      ],
    );
  }
}