import 'package:communitytabs/logic/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:communitytabs/data/expansionTileMetadata.dart';
import 'package:communitytabs/constants/marist_color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExpansionTiles _expansionPanels = Provider.of<ExpansionTiles>(context);
    HomePageViewCubit _homePageViewCubit = BlocProvider.of<HomePageViewCubit>(context);

    final SlidingUpPanelState _slidingUpPanelState =
        context.watch<SlidingUpPanelCubit>().state;

    /// Sliding panel is open
    /// Show an empty container to make room for the Create Event Screens App Bar
    if (_slidingUpPanelState is SlidingUpPanelOpen) {
      return SizedBox();
    } // if

    /// Sliding Panel is closed
    /// Show the bottom navigation bar buttons
    else if (_slidingUpPanelState is SlidingUpPanelClosed) {
      return Stack(
        children: <Widget>[
          Container(color: Colors.white),
          Container(decoration: BoxDecoration(gradient: cMaristGradient)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  color: kHavenLightGray,
                  splashColor: kActiveHavenLightGray,
                  onPressed: () {
                    /// Allows home button to be used to close a category list
                    /// Works by defaulting the page view index back to 0
                    if (_homePageViewCubit.currentPage() == 1.0) {
                      _homePageViewCubit.animateToHomePage();
                    } // if
                  }),
              IconButton(
                  icon: Icon(Icons.add),
                  color: kHavenLightGray,
                  splashColor: kActiveHavenLightGray,
                  onPressed: () {
                    DateTime currentTime = DateTime.now();

                    /// Open the panel
                    BlocProvider.of<SlidingUpPanelCubit>(context).openPanel();

                    _expansionPanels.data[0].setHeaderDateValue(currentTime);
                    _expansionPanels.data[0].setHeaderTimeValue(currentTime);
                    _expansionPanels.updateExpansionPanels();

                    /// Remember the original Start Date and Time
                    _expansionPanels.originalStartDateAndTime = currentTime;
                  }),
              IconButton(
                  icon: Icon(Icons.person),
                  color: kHavenLightGray,
                  splashColor: kActiveHavenLightGray,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/account');
                  }),
            ],
          ),
        ],
      );
    } // else-if

    /// Sliding Up Panel Cubit did not return a state that is either open or closed
    else {
      return Container(
          child: Center(
              child: Text(
                  'Sliding Up Panel Cubit did not return a state that is either open or closed!')));
    } // else
  }
}
