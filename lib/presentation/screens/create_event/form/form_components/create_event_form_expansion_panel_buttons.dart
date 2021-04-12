import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:communitytabs/logic/cubits/cubits.dart';
import 'package:communitytabs/constants/marist_color_scheme.dart';

/// A void callback that triggers from the Flutter defined Button onPressed() property.
///
/// The argument passed back during the callback is the current temporary DateTime stored in the ExpansionPanelCubit.
typedef OnPressedCallback = void Function();

class ExpansionPanelCancelButton extends StatelessWidget {

  /// A void callback that triggers from the Flutter defined Button onPressed() property.
  final OnPressedCallback onPressedCallback;
  const ExpansionPanelCancelButton({required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Cancel', style: TextStyle(color: cWhite100)),
      onPressed: onPressedCallback,
    );
  }// build
}// ExpansionPanelCancelButton

class ExpansionPanelBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Back', style: TextStyle(color: cWhite100)),
      onPressed: () {
        BlocProvider.of<DateTimePickerCubit>(context).openExpansionPanelToDatePicker();
      },
    );
  }// build
}// ExpansionPanelPreviousButton


class ExpansionPanelContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Continue', style: TextStyle(color: cBlue)),
      onPressed: () {
        BlocProvider.of<DateTimePickerCubit>(context).openExpansionPanelToTimePicker();
      },
    );
  }// build
}// ExpansionPanelPreviousButton

class ExpansionPanelConfirmButton extends StatelessWidget {

  /// A void callback that triggers from the Flutter defined Button onPressed() property.
  ///
  /// The argument passed back during the callback is the current temporary DateTime stored in the ExpansionPanelCubit.
  final OnPressedCallback onPressedCallback;
  const ExpansionPanelConfirmButton({required this.onPressedCallback});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Confirm', style: TextStyle(color: cBlue)),
      onPressed: onPressedCallback,
    );
  }// build
}// ExpansionPanelConfirmButton