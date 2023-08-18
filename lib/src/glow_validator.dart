import 'dart:async';

import 'package:flutter/material.dart';

class GlowValidator extends StatefulWidget {
  const GlowValidator(
      {Key? key,
      required this.child,
      required this.enableAnimation,
      this.animationBegins,
      this.animationEnds,
      this.duration,
      this.glowColor,
      this.stopAnimationAfter,
      this.borderRadius})
      : super(key: key);
  final Widget child;
  final bool enableAnimation;
  final Duration? duration;
  final double? animationBegins;
  final double? animationEnds;
  final Color? glowColor;
  final Duration? stopAnimationAfter;
  final double? borderRadius;

  @override
  State<GlowValidator> createState() => _GlowValidatorState();
}

class _GlowValidatorState extends State<GlowValidator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: widget.duration ?? const Duration(seconds: 2));

    _animation = Tween(
            begin: widget.animationBegins ?? 0.0,
            end: widget.animationEnds ?? 10.0)
        .animate(_animationController)
      ..addListener(() {
        setState(() {
          // No need to add anything here since you're using setState only for testing
        });
      });

    if(widget.enableAnimation){
      _animationController.repeat(reverse: true);
      Timer(widget.stopAnimationAfter ?? const Duration(seconds: 8), () {
        setState(() {
          _animationController.stop();
          _animationController.value = 0;
        });
      });
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant GlowValidator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.enableAnimation){
      _animationController.repeat(reverse: true);
      Timer(widget.stopAnimationAfter ?? const Duration(seconds: 8), () {
        setState(() {
          _animationController.stop();
          _animationController.value = 0;
        });
      });
    }else{
      _animationController.stop();
      _animationController.value = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          boxShadow: [
            BoxShadow(
                color: widget.glowColor ?? Colors.red,
                blurRadius: _animation.value,
                spreadRadius: _animation.value,
                blurStyle: BlurStyle.normal)
          ]),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the AnimationController
    super.dispose();
  }
}
