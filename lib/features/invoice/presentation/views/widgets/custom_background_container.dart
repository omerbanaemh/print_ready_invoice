import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';

class CustomBackgroundContainer extends StatelessWidget {
  const CustomBackgroundContainer({
    super.key,
    required this.child,
    this.padding, 
    this.widthRatio =  0.45,    
  });

  final Widget child;
  final double? padding;
  final double widthRatio;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 500),
        child: Container(
          width: SizeConfig.width(context) * widthRatio,
          padding: EdgeInsets.all(padding ?? 20),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
