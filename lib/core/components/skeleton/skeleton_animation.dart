import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../extensions/app_extensions.dart';
import '../container/skeleton_container.dart';

class SkeletonAnimation extends Shimmer {
  SkeletonAnimation({Key? key, required BuildContext context})
      : super(
          duration: context.durationLow,
          child: _borderedItem(context),
        );

  static Container _borderedItem(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: context.lowBorderRadius,
          border: Border.all(
            color: context.secondaryTextColor.withOpacity(0.5),
          ),
        ),
        child: _item(context),
      );

  static ListTile _item(BuildContext context) => ListTile(
        contentPadding: context.paddingNormal,
        leading: SkeletonContainer(aspectRaito: 1.15, context: context),
        title: SkeletonContainer(aspectRaito: 8, context: context),
        subtitle: _subtitle(context),
      );

  static Padding _subtitle(BuildContext context) => Padding(
        padding: context.paddingLow,
        child: Wrap(
          children: [
            _smallContainer(context),
            context.emptySizedHeightBoxLow3x,
            _smallContainer(context),
            context.emptySizedHeightBoxLow3x,
            _smallContainer(context)
          ],
        ),
      );

  static SkeletonContainer _smallContainer(BuildContext context) =>
      SkeletonContainer(aspectRaito: 10, context: context);
}
