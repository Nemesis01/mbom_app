import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mbom_app/blocs/bloc_provider.dart';
import 'package:mbom_app/blocs/bloc_account.dart';
import 'package:mbom_app/custom/custom_app_bar.dart';
import 'package:mbom_app/custom/custom_card_text_field.dart';
import 'package:mbom_app/custom/custom_text_field.dart';
import 'package:mbom_app/custom/custom_list_tile.dart';
import 'package:mbom_app/utils/string_formatter.dart';
import 'package:mbom_app/views/screen_base.dart';

class AccountScreen extends StatelessWidget implements ScreenAppBase {
  //region StatelessWidget Interface
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }
  //endregion

//region ScreenAppBaseInterface
  @override
  Widget buildAppbar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(LineAwesomeIcons.angle_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text('My Mbom'),
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
    double screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    return (screenWidth < 600) ? portrait(context) : landscape(context);
  }

  @override
  Widget landscape(BuildContext context) {
    // TODO: implement landscape
    return null;
  }

  @override
  Widget portrait(BuildContext context) {
    // TODO: implement portrait
    return Scaffold(
      body: _buildMainContent(context),
    );
  }
  //endregion

  Widget _buildMainContent(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.only(top: 28.0),
                sliver: SliverToBoxAdapter(
                  child: _profilePicture(context),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                    left: 16.0, top: 28.0, right: 16.0, bottom: 16.0),
                sliver: SliverToBoxAdapter(
                  child: _dashboardMini(context),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                sliver: SliverToBoxAdapter(
                  child: _options(context),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                sliver: SliverToBoxAdapter(
                  child: _appSettings(context),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                sliver: SliverToBoxAdapter(
                  child: _globalSettings(context),
                ),
              ),
            ],
          ),
          buildAppbar(context),
        ],
      ),
    );
  }

  Widget _profilePicture(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            'Super Username',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        SizedBox(width: 16.0),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Material(
            color: Colors.deepPurple.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(24.0),
              child: SizedBox(
                height: 90.0, //180.0
                width: 90.0, //180.0
                child: Icon(
                  LineAwesomeIcons.camera,
                  size: 44.0,
                ),
              ),
              onTap: () {},
            ),
          ),
        )
      ],
    );
  }

  Widget _dashboardMini(BuildContext context) {
    final bloc = BlocProvider.of<AccountBloc>(context);

    return StreamBuilder(
      stream: bloc.dashboardItems,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, int> items = snapshot.data;
          return Container(
            //background: Icon(null),
            //backgroundColor: Theme.of(context).accentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                return Container(
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '${items.values.toList()[index]}',
                        style: TextStyle(fontSize: 32.0, letterSpacing: -2.0),
                      ),
                      Text(
                        '${items.keys.toList()[index]}',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _options(BuildContext context) {
    final bloc = BlocProvider.of<AccountBloc>(context);
    return StreamBuilder(
      stream: bloc.optionsObservable,
      builder: (context, snapshot) {
        if (snapshot.hasData && !snapshot.hasError) {
          var options = snapshot.data;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CustomDataCard(
                  backgroundColor: Colors.deepPurple,
                  background: Icon(LineAwesomeIcons.clipboard),
                  child: CustomListTile(
                    title: '${options[1]}',
                    subtitle: 'Order history, in process',
                    onTap: () {
                      Navigator.pushNamed(context, '/orders');
                    },
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CustomDataCard(
                  backgroundColor: Colors.deepPurple,
                  background: Icon(LineAwesomeIcons.credit_card),
                  child: CustomListTile(
                    title: '${options[2]}',
                    subtitle: 'Manage your credit cards',
                    onTap: () {
                      Navigator.pushNamed(context, '/wallet');
                    },
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CustomDataCard(
                  backgroundColor: Colors.deepPurple,
                  background: Icon(LineAwesomeIcons.map_marker),
                  child: CustomListTile(
                    title: '${options[0]}',
                    subtitle: 'Manage your delivery addresses',
                    onTap: () {
                      Navigator.pushNamed(context, '/Addresses');
                    },
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _appSettings(BuildContext context) {
    final bloc = BlocProvider.of<AccountBloc>(context);

    return StreamBuilder(
      stream: bloc.appSettings,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<String> settings = snapshot.data;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CustomDataCard(
                  background: Icon(LineAwesomeIcons.cog),
                  child: CustomListTile(
                    title: '${settings[0]}',
                    subtitle: 'Manage your app preferences',
                    onTap: () {
                      Navigator.pushNamed(context, '/preferences');
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CustomDataCard(
                  background: Icon(LineAwesomeIcons.language),
                  child: CustomListTile(
                    title: '${settings[1]}',
                    subtitle: 'Manage your credit cards',
                    onTap: () {
                      Navigator.pushNamed(context, '/wallet');
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CustomDataCard(
                  background: Icon(LineAwesomeIcons.share_alt),
                  child: CustomListTile(
                    title: '${settings[2]}',
                    subtitle: 'Manage your credit cards',
                    onTap: () {
                      Navigator.pushNamed(context, '/wallet');
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CustomDataCard(
                  //backgroundColor: Colors.deepPurple,
                  background: Icon(LineAwesomeIcons.star_o),
                  child: CustomListTile(
                    title: '${settings[3]}',
                    subtitle: 'Manage your credit cards',
                    onTap: () {
                      Navigator.pushNamed(context, '/wallet');
                    },
                    // backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _globalSettings(BuildContext context) {
    final bloc = BlocProvider.of<AccountBloc>(context);

    return StreamBuilder(
        stream: bloc.globalSettings,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var settings = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: CustomDataCard(
                    backgroundColor: Colors.black12,
                    background: Icon(LineAwesomeIcons.power_off),
                    child: CustomListTile(
                      title: StringFormatter.capitalize('${settings[0]}'),
                      subtitle: 'Disconnect from the app',
                      onTap: () {
                        Navigator.pushNamed(context, '/orders');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: CustomDataCard(
                    backgroundColor: Colors.red.shade400,
                    background: Icon(LineAwesomeIcons.trash_o),
                    child: CustomListTile(
                      title: StringFormatter.capitalize('${settings[1]}'),
                      subtitle: 'Erase all your data',
                      onTap: () {
                        Navigator.pushNamed(context, '/wallet');
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        });
  }

  //region Navigation
  void _navigate(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
  //endregion

}
