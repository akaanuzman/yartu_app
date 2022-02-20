import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class SpecialListViewSeperated extends StatelessWidget {
  final Widget child;
  
  const SpecialListViewSeperated({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: context.paddingNormal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => child,
      separatorBuilder: (context, index) => context.emptySizedHeightBoxLow3x,
      itemCount: 5,
    );
  }
}
