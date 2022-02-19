import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../home/folders/view/folders_view.dart';
import '../../home/upload/view/upload_view.dart';
import '../../home/mail/tab/view/mail_tab_view.dart';
import '../../../product/components/items/drawer_item.dart';
import '../../../product/components/textformfield/bordered_text_form_field.dart';

import '../../../../core/extensions/app_extensions.dart';
import '../model/tabbar_model.dart';

class TabbarView extends StatelessWidget {
  static const login = '/tabbar';

  final List<TabbarModel> _tabItems = [
    TabbarModel(icon: Icons.mail_outline, child: MailTabView()),
    TabbarModel(icon: Icons.file_upload_outlined, child: const UploadView()),
    TabbarModel(icon: Icons.folder, child: const FoldersView()),
    TabbarModel(icon: Icons.dashboard, child: const Scaffold()),
    TabbarModel(icon: Icons.description_outlined, child: const Scaffold()),
  ];

  TabbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: _tabItems.length,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: _buildTabBar(context, _tabItems),
          ),
          body: _buildTabBarView(_tabItems),
          appBar: _appBar(context),
          drawer: _drawer(context),
        ),
      );

  AppBar _appBar(BuildContext context) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: context.secondaryTextColor),
        title: _appBarTextFormField(context),
        actions: [
          Padding(
            padding: context.horizontalPaddingNormal,
            child: Stack(
              alignment: Alignment.topRight,
              children: [_appBarCircleAvatar(context), _appBarOnlineIcon()],
            ),
          )
        ],
      );

  Widget _appBarTextFormField(BuildContext context) => SizedBox(
        height: context.dynamicHeight(0.04),
        child: BorderedTextFormField(
          context: context,
          prefixIcon: Icon(
            Icons.search,
            color: context.secondaryTextColor,
          ),
          hintText: "Search...",
          contentPadding: context.paddingLow,
          borderRadius: context.normalBorderRadius,
        ),
      );

  Widget _appBarCircleAvatar(BuildContext context) => Padding(
        padding: context.paddingLow,
        child: CircleAvatar(
          backgroundColor: context.yellowSea,
          child: const Text(
            "AŞ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      );

  Widget _appBarOnlineIcon() => const Positioned(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 6.5,
            backgroundColor: Colors.green,
          ),
        ),
      );

  Drawer _drawer(BuildContext context) => Drawer(
        child: FadeInUp(
          child: ListView(
            padding: context.paddingMedium,
            children: [
              DrawerItem(
                  context: context, icon: Icons.mail_outline, text: "Messages"),
              DrawerItem(
                context: context,
                icon: Icons.file_upload_outlined,
                text: "Items",
              ),
              DrawerItem(context: context, icon: Icons.folder, text: "Folders"),
              DrawerItem(
                  context: context, icon: Icons.dashboard, text: "Dashboard"),
              DrawerItem(
                  context: context,
                  icon: Icons.description_outlined,
                  text: "Details"),
            ],
          ),
        ),
      );

  Widget _buildTabBar(BuildContext context, List<TabbarModel> _items) =>
      Container(
        padding: EdgeInsets.only(bottom: context.lowValue),
        color: context.primaryVariantColor,
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            context.highValue,
            context.lowValue,
            context.highValue,
            0,
          ),
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: context.textColor,
          labelColor: context.primaryColor,
          indicatorColor: Colors.transparent,
          indicator: BoxDecoration(
              border: Border.all(color: context.primaryColor),
              borderRadius: context.extraLowBorderRadius,
              color: Colors.white),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: _buildTabs(_items, context),
        ),
      );

  List<Widget> _buildTabs(List<TabbarModel> _items, BuildContext context) =>
      List.generate(
        _items.length,
        (index) => Container(
          margin: context.horizontalPaddingLow,
          child: Tab(
            icon: Icon(_items[index].icon),
          ),
        ),
      );

  Widget _buildTabBarView(List<TabbarModel> models) =>
      TabBarView(children: models.map((e) => e.child).toList());
}
