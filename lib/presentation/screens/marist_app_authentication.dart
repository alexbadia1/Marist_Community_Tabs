import 'package:communitytabs/presentation/routes/navigation_authentication.dart';
import 'package:flutter/material.dart';

class MaristAppAuthentication extends StatefulWidget {
  final RouteGeneratorAuthentication routeGeneratorAuthentication;

  MaristAppAuthentication({required this.routeGeneratorAuthentication});
  @override
  _MaristAppAuthenticationState createState() => _MaristAppAuthenticationState();
}

class _MaristAppAuthenticationState extends State<MaristAppAuthentication> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: this.widget.routeGeneratorAuthentication.onGenerateRoute,
      initialRoute: '/login',
    );
  }// build

@override
  void dispose() {
    this.widget.routeGeneratorAuthentication.close();
    super.dispose();
  }// dispose
}
