import 'package:flutter/animation.dart';

class DetailBookAnimation {
  DetailBookAnimation(this.controller)
      : backdropBlurX = Tween(begin: 0.0, end: 50.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
                0.15,
                0.65,
                curve: Curves.ease
            ))),
        backdropBlurY = Tween(begin: 0.0, end: 5.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(
                    0.15,
                    0.65,
                    curve: Curves.ease
                ))),
        backdropOpacity = Tween(begin: 0.0, end: 0.5).animate(
          CurvedAnimation(
            parent: controller,
            curve:  const Interval(
                0.15,
                0.650,
                curve: Curves.ease
            ))),
        descriptionOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
                0.5,
                0.65,
              curve: Curves.fastOutSlowIn
            ))),
        descriptionScrollerYTranslation = Tween(begin: 60.0, end: 0.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(
                    0.5,
                    0.65,
                    curve: Curves.slowMiddle
                ))),
        titleOpacity = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(
                    0.8,
                    0.9,
                    curve: Curves.ease
                ))),
        authorsOpacity = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(
                    0.65,
                    0.80,
                    curve: Curves.ease
                ))),
        pictureSize = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(
                    0.80,
                    1.0,
                    curve: Curves.elasticIn
                )));

  final AnimationController controller;
  final Animation<double> backdropOpacity;
  final Animation<double> backdropBlurX;
  final Animation<double> backdropBlurY;
  final Animation<double> descriptionOpacity;
  final Animation<double> descriptionScrollerYTranslation;
  final Animation<double> titleOpacity;
  final Animation<double> authorsOpacity;
  final Animation<double> pictureSize;
}
