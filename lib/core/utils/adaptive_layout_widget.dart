import 'package:flutter/material.dart';
import 'package:print_ready_invoice/core/utils/size_config.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  const AdaptiveLayoutWidget({
    super.key,
    required this.mobileLayout,
    required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout, desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (SizeConfig.width(context) < 550) {
          return mobileLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}