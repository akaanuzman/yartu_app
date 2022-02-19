import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_extensions.dart';
import '../../../../tabs/model/tabbar_model.dart';
import '../../all_mail/view/all_mail_view.dart';
import '../../starred_mail/view/starred_mail_view.dart';
import '../../unread_mail/view/unread_mail_view.dart';

class MailTabView extends StatelessWidget {
  final List<TabbarModel> _tabItems = [
    TabbarModel(text: "TÜMÜ", child: const AllMailView()),
    TabbarModel(text: "OKUNMAMIŞ", child: const UnreadMailView()),
    TabbarModel(text: "YILDIZLI", child: const StarredMailView()),
  ];

  MailTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: _tabItems.length,
        child: Scaffold(
          body: _buildTabBarView(_tabItems),
          appBar: _appBar(context, _tabItems),
        ),
      );

  AppBar _appBar(BuildContext context, List<TabbarModel> _items) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: _buildTabBar(context, _items),
      );

  TabBar _buildTabBar(BuildContext context, List<TabbarModel> _items) => TabBar(
        padding: context.horizontalPaddingLow,
        unselectedLabelColor: context.secondaryTextColor,
        labelColor: Colors.white,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicator: BoxDecoration(
            border: Border.all(color: context.primaryColor),
            borderRadius: context.lowBorderRadius,
            color: context.primaryColor),
        tabs: _buildTabs(context),
      );

  List<Widget> _buildTabs(BuildContext context) => List.generate(
        _tabItems.length,
        (index) => Tab(
          text: _tabItems[index].text,
        ),
      );

  Widget _buildTabBarView(List<TabbarModel> models) =>
      TabBarView(children: models.map((e) => e.child).toList());
}
