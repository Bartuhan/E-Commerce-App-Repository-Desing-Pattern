import 'package:e_commerce_ui_project/commons/widgets/custom_shapes/custom_curved_edges.dart';
import 'package:flutter/material.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvesEdges(offset: 50),
      child: child,
    );
  }
}
