import 'package:communitytabs/buttons/maristFoxLogo.dart';
import 'package:communitytabs/components/account/accountDrawerContents.dart';
import 'package:communitytabs/constants/marist_color_scheme.dart';
import 'package:communitytabs/presentation/components/sliver_app_bar.dart';
import 'package:flutter/material.dart';

class AccountScreenBody extends StatefulWidget {
  @override
  _AccountScreenBodyState createState() => _AccountScreenBodyState();
}

class _AccountScreenBodyState extends State<AccountScreenBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<User>(context);

    String accountName = '';

    // user == null ? accountName = '' : accountName = user.getFirstName + ' ' + user.getLastName;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: AccountDrawerContents(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * .0725),
          child: AppBar(
            iconTheme: IconThemeData(color: kHavenLightGray),
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .0725,
              child: Stack(
                children: <Widget>[
                  Image(
                      width: double.infinity,
                      height: 100.0,
                      image: ResizeImage(
                        AssetImage("images/tenney.jpg"),
                        width: 500,
                        height: 100,
                      ),
                      fit: BoxFit.fill),
                  Container(decoration: BoxDecoration(gradient: cMaristGradientWashed)),
                  Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(flex: 4, child: MaristFoxLogo()),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(flex: 30, child: MaristSliverAppBarTitle(title: accountName),),
                      Expanded(flex: 3, child: SizedBox()),
                      Expanded(flex: 2, child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: cBackground,
          child: Center(
            child: Text('Account Content TBA', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
