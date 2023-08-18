import 'package:flutter/material.dart';

class AnimeValidator extends StatefulWidget {
  const AnimeValidator(
      {Key? key,
      required this.child,
      required this.enableAnimation,
      this.duration,
      this.animationBegins,
      this.animationEnds,
      this.curve})
      : super(key: key);
  final Widget child;
  final bool enableAnimation;
  final Duration? duration;
  final double? animationBegins;
  final double? animationEnds;
  final Curve? curve;

  @override
  State<AnimeValidator> createState() => _AnimeValidatorState();
}

class _AnimeValidatorState extends State<AnimeValidator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(
            begin: widget.animationBegins ?? 0,
            end: widget.animationEnds ?? 10)
        .animate(
      CurvedAnimation(
          parent: _controller, curve: widget.curve ?? Curves.elasticIn),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    _controller.addListener(() {
      setState(() {});
    });

    if (widget.enableAnimation) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimeValidator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.enableAnimation &&
        _controller.status != AnimationStatus.forward) {
      _controller.forward(from: 0.0);
    } else if (!widget.enableAnimation &&
        _controller.status != AnimationStatus.dismissed) {
      _controller.reverse(from: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_animation.value, 0),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
