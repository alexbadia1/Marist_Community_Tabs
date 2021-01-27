import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:database_repository/database_repository.dart';

abstract class SuggestedEventsState extends Equatable {
  const SuggestedEventsState();
}// SuggestedEventsState

class SuggestedEventsStateFetching extends SuggestedEventsState {
  @override
  List<Object> get props => [];
}// SuggestedEventsFetching

class SuggestedEventsStateFailed extends SuggestedEventsState {
  @override
  List<Object> get props => [];
}// SuggestedEventsStateFailed

class SuggestedEventsStateSuccess extends SuggestedEventsState {
  final List<EventModel> eventModels;
  final bool maxEvents;

  SuggestedEventsStateSuccess({@required this.eventModels, @required this.maxEvents});
  @override
  List<Object> get props => [eventModels,maxEvents];
}// SuggestedEventsStateFailed