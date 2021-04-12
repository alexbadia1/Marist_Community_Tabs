import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:communitytabs/logic/cubits/cubits.dart';

class EventScreenArguments {
  final String documentId;
  final Uint8List? imageBytes;

  EventScreenArguments({required this.documentId, this.imageBytes});

}// EventScreenArguments

class AccountScreenArguments {
  final HomePageViewCubit homePageViewCubit;

  AccountScreenArguments({required this.homePageViewCubit});
}// AccountScreenArguments