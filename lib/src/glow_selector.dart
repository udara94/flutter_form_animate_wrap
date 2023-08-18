import 'package:flutter/material.dart';

class GlowSelector extends StatefulWidget {
  const GlowSelector(
      {Key? key,
      required this.child,
      required this.focusNode,
      this.enableFocusGlowing,
      this.duration,
      this.animationBegins,
      this.animationEnds,
      this.focusGlowColor,
      this.borderRadius})
      : super(key: key);
  final Widget child;
  final FocusNode focusNode;
  final bool? enableFocusGlowing;
  final Duration? duration;
  final double? animationBegins;
  final double? animationEnds;
  final Color? focusGlowColor;
  final double? borderRadius;

  @override
  State<GlowSelector> createState() => _GlowSelectorState();
}

class _GlowSelectorState extends State<GlowSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  bool enableFocusGlowing = true;

  @override
  void initState() {
    enableFocusGlowing = widget.enableFocusGlowing ?? true;

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


    widget.focusNode.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    if (enableFocusGlowing) {
      if (widget.focusNode.hasFocus) {
        _animationController.repeat(reverse: true); // Start animation
      } else {
        _animationController.value = 0;
        _animationController.stop(); // Stop animation
      }
    }
  }


  @override
  void didUpdateWidget(covariant GlowSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius?? 0),
          // shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                    color: widget.focusGlowColor ?? Colors.lightBlue,
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
