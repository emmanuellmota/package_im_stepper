import 'package:flutter/material.dart';

class BaseIndicator extends StatelessWidget {
  /// Whether this indicator is selected or not.
  final bool isSelected;

  /// The child to be placed within the indicator.
  final Widget? child;

  /// Action to be taken when this indictor is pressed.
  final Function? onPressed;

  /// Color of this indicator when it is not selected.
  final Color? color;

  /// Color of this indicator when it is selected.
  final Color? activeColor;

  /// Border color of this indicator when it is selected.
  final Color? activeBorderColor;

  /// The border width of this indicator when it is selected.
  final activeBorderWidth;

  /// Radius of this indicator.
  final double radius;

  /// The amount of padding around each side of the child.
  final double padding;

  /// The amount of margin around each side of the indicator.
  final double margin;

  /// Color of this indicator when it is completed.
  final Color? completedColor;

  final bool? isStepCompleted;

  final bool canStep;

  const BaseIndicator({
    super.key,
    this.isStepCompleted,
    this.completedColor,
    this.isSelected = false,
    this.child,
    this.onPressed,
    this.color,
    this.activeColor,
    this.activeBorderColor,
    this.radius = 24.0,
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeBorderWidth = 0.5,
    this.canStep = true,
  });

  bool get isCompleted {
    return ((isStepCompleted ?? false));
  }

  Color getIndicatorColor() {
    if (isSelected) {
      return activeColor ?? Colors.green;
    }
    if (isStepCompleted == true || canStep) {
      return completedColor ?? Colors.green;
    } else {
      return color ?? Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isSelected ? EdgeInsets.all(margin) : EdgeInsets.zero,
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(
                color: activeBorderColor ?? Colors.blue,
                width: activeBorderWidth,
              )
            : null,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: onPressed as void Function()?,
            child: Container(
              height: radius * 2,
              width: radius * 2,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: getIndicatorColor(),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: child,
              ),
            ),
          ),
          if (isCompleted)
            const Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 17,
                ))
        ],
      ),
    );
  }
}
