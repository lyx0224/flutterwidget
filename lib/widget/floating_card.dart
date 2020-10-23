import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingCard extends StatelessWidget {
  final Widget child;

  const FloatingCard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
        //A widget representing a physical layer that clips its children to a shape.
        child: PhysicalModel(
            color: CupertinoColors.white,
            child: child,
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            borderRadius: BorderRadius.circular(12.0)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20));
  }
}
