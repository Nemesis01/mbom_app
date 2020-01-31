import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mbom_app/custom/custom_app_bar.dart';
import 'package:mbom_app/views/screen_base.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin
    implements ScreenAppBase {
  //region Members
  final ScrollController _scrollController = ScrollController();

  bool _show = true;
  bool _showAppbar = true;
  bool _isScrollingDown = false;
  //endregion

  //region Lifecycle Methods
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  @override
  void initState() {
    super.initState();
    onScroll();
    //_scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    super.dispose();
  }
  //endregion

  @override
  Widget buildAppbar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        //iconSize: 20.0,
        icon: Icon(LineAwesomeIcons.angle_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'My Orders',
        style: Theme.of(context).textTheme.title.copyWith(fontSize: 18.0),
      ),
      actions: <Widget>[
        /*IconButton(
          icon: Icon(LineAwesomeIcons.edit),
          onPressed: () {},
        ),*/
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    return width < 600 ? portrait(context) : landscape(context);
  }

  @override
  Widget landscape(BuildContext context) {
    // TODO: implement landscape
    return Container();
  }

  @override
  Widget portrait(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //top: false,
        child: Stack(
          children: <Widget>[
            _buildMainContent(context),
            _showAppbar
                ? buildAppbar(context)
                : PreferredSize(
                    child: Container(),
                    preferredSize: Size(0, 0),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (end) {
        if (true) return;
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _placeHolder(context),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }

  Widget _placeHolder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            LineAwesomeIcons.clipboard,
            size: 160.0,
            color: Theme.of(context).accentColor.withOpacity(0.48),
          ),
          SizedBox(height: 10.0),
          Text(
            'Seems that you have not orders registered since last 6 months',
            //style: Theme.of(context).textTheme.headline,
          ),
        ],
      ),
    );
  }

  //region Animations
  void showAppbar() {
    setState(() {
      _show = true;
    });
  }

  void hideAppbar() {
    setState(() {
      _show = false;
    });
  }

  //endregion
  void onScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          _showAppbar = false;
          hideAppbar();
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          _showAppbar = true;
          showAppbar();
        }
      }
    });
  }
}
