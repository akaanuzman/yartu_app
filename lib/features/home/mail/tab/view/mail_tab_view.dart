import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_extensions.dart';
import '../../../../tabs/model/tabbar_model.dart';
import '../../all_mail/view/all_mail_view.dart';
import '../../starred_mail/view/starred_mail_view.dart';
import '../../unread_mail/view/unread_mail_view.dart';

class MailTabView extends StatelessWidget {
  static const path = '/mailtab';

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

  PreferredSize _appBar(BuildContext context, List<TabbarModel> _items) =>
      PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: _buildTabBar(context, _items),
        ),
      );

  TabBar _buildTabBar(BuildContext context, List<TabbarModel> _items) => TabBar(
        unselectedLabelColor: context.secondaryTextColor,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
            border: Border.all(color: context.primaryColor),
            borderRadius: context.lowBorderRadius,
            color: context.primaryColor),
        tabs: _buildTabs(context),
      );

  List<Widget> _buildTabs(BuildContext context) => List.generate(
        _tabItems.length,
        (index) => AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: context.primaryColor),
              borderRadius: context.lowBorderRadius,
            ),
            child: Text(
              _tabItems[index].text ?? "",
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      );

  Widget _buildTabBarView(List<TabbarModel> models) =>
      TabBarView(children: models.map((e) => e.child).toList());
}
