import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communitytabs/data/club_event_data.dart';
import 'package:communitytabs/data/searchResult.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService extends ChangeNotifier {
  /// TODO: Add Nearby Events Stream

  /// Suggested
  Stream<List<ClubEventData>> streamSuggested;

  /// Student
  Stream<List<ClubEventData>> streamAcademic;
  Stream<List<ClubEventData>> streamPolitical;
  Stream<List<ClubEventData>> streamMediaPublication;

  /// Sports
  Stream<List<ClubEventData>> streamIntramural;
  Stream<List<ClubEventData>> streamCollegeSports;
  Stream<List<ClubEventData>> streamClubSports;

  /// Diversity
  Stream<List<ClubEventData>> streamCulture;
  Stream<List<ClubEventData>> streamReligion;
  Stream<List<ClubEventData>> streamSpiritual;

  /// Greek
  Stream<List<ClubEventData>> streamFraternity;
  Stream<List<ClubEventData>> streamSorority;
  Stream<List<ClubEventData>> streamRushes;

  /// Food
  Stream<List<ClubEventData>> streamFreeFood;
  Stream<List<ClubEventData>> streamMaristDining;
  Stream<List<ClubEventData>> streamOccasions;

  /// Art
  Stream<List<ClubEventData>> streamMoviesTheatre;
  Stream<List<ClubEventData>> streamMusicDance;

  //Get local user data
  final String uid;

  //Create a collection reference
  final CollectionReference _eventsCollection =
      Firestore.instance.collection('events');

  final CollectionReference _searchEventsCollection =
      Firestore.instance.collection('searchEvents');

  //Create a collection reference
  final CollectionReference _usersCollection =
      Firestore.instance.collection('user');

  //Constructor
  DatabaseService({this.uid});

  //Update document function, creates a new document if one doesn't already exist
  Future updateUserData(String email, String password) async {
    return await _usersCollection
        .document(uid)
        .setData({'email': email, 'password': password});
  } //updateUserData

  Future addEvent({@required ClubEventData newEvent}) async {
    return await _eventsCollection.document().setData({
      'title': newEvent.getTitle ?? '',
      'host': newEvent.getHost ?? '',
      'location': newEvent.getLocation ?? '',
      'room': newEvent.getRoom ?? '',
      'category': newEvent.myCategory ?? '',
      'highlights': newEvent.getHighlights ?? [],
      'summary': newEvent.getSummary ?? '',
      'rawStartDateAndTime': newEvent.getRawStartDateAndTime ?? null,
      'rawEndDateAndTime': newEvent.getRawEndDateAndTime ?? null,
      'imagePath': newEvent.getImagePath ?? '',
      'imageFitCover': newEvent.getImageFitCover ?? true,
    });
  }

  Future addEventToSearchable({@required ClubEventData newEvent}) async {
    return await _searchEventsCollection.document().setData({
      'title': newEvent.getTitle.toLowerCase() ?? '',
      'category': newEvent.myCategory ?? '',
      'location': newEvent.getLocation.toLowerCase() ?? '',
      'host': newEvent.getHost.toLowerCase() ?? '',
    });
  } //addEvent

  ///Creating a Local Object Instance of an Event for ease of use
  List<ClubEventData> _eventListFromSnapshot(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      Timestamp tempRawStartDateAndTime = doc.data['rawStartDateAndTime'];
      Timestamp tempRawEndDateAndTime = doc.data['rawEndDateAndTime'];

      DateTime tempRawStartDateAndTimeToDateTime;
      DateTime tempRawEndDateAndTimeToDateTime;

      if (tempRawStartDateAndTime != null)
        tempRawStartDateAndTimeToDateTime = DateTime.fromMillisecondsSinceEpoch(
                tempRawStartDateAndTime.millisecondsSinceEpoch)
            .toUtc()
            .toLocal();
      else
        tempRawStartDateAndTimeToDateTime = null;

      if (tempRawEndDateAndTime != null)
        tempRawEndDateAndTimeToDateTime = DateTime.fromMillisecondsSinceEpoch(
                tempRawEndDateAndTime.millisecondsSinceEpoch)
            .toUtc()
            .toLocal();
      else
        tempRawEndDateAndTimeToDateTime = null;

      return ClubEventData(

          /// RawStartDate converted to [DATETIME] from [TIMESTAMP] in Firebase.
          newRawStartDateAndTime: tempRawStartDateAndTimeToDateTime ?? null,

          /// RawEndDate converted to [DATETIME] from [TIMESTAMP] in Firebase.
          newRawEndDateAndTime: tempRawEndDateAndTimeToDateTime ?? null,

          ///Category converted to [STRING] from [STRING] in Firebase.
          newCategory: doc.data['category'] ?? '',

          ///Host converted to [STRING] from [STRING] in Firebase.
          newHost: doc.data['host'] ?? '',

          ///Title converted to [STRING] from [STRING] in Firebase.
          newTitle: doc.data['title'] ?? '',

          ///Location Converted to [] from [] in Firebase.
          newLocation: doc.data['location'] ?? '',

          ///Room converted to [STRING] from [String] in Firebase.
          newRoom: doc.data['room'] ?? '',

          ///Summary converted to [STRING] from [STRING] in Firebase.
          newSummary: doc.data['summary'] ?? '',

          ///Highlights converted to [List<String>] from [List<dynamic>] in Firebase.
          newHighlights:
              List.from(doc.data['highlights']) ?? ['', '', '', '', ''],

          ///Implement Firebase Images.
          newImageFitCover: doc.data['imageFitCover'] ?? true,
          newImagePath: doc.data['imagePath'] ?? '');
    }).toList();
  } //_eventListFromSnapshot

  //Use Stream to get QuerySnapshots
  void activateSuggestedStream() {
    streamSuggested = _eventsCollection
        .where('category', isEqualTo: 'Suggested')
        .snapshots()
        .map(_eventListFromSnapshot);
    //notifyListeners();
  } //Stream get events

  void activateArtsStreams() {
    streamMusicDance = _eventsCollection
        .where('category', isEqualTo: 'Music & Dance')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamMoviesTheatre = _eventsCollection
        .where('category', isEqualTo: 'Movies & Theatre')
        .snapshots()
        .map(_eventListFromSnapshot);
    //notifyListeners();
  }

  void activateDiversityStreams() {
    streamCulture = _eventsCollection
        .where('category', isEqualTo: 'Culture')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamReligion = _eventsCollection
        .where('category', isEqualTo: 'Religion')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamSpiritual = _eventsCollection
        .where('category', isEqualTo: 'Spiritual')
        .snapshots()
        .map(_eventListFromSnapshot);
    //notifyListeners();
  }

  void activateSportsStreams() {
    streamIntramural = _eventsCollection
        .where('category', isEqualTo: 'Intramural')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamClubSports = _eventsCollection
        .where('category', isEqualTo: 'Club Sports')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamCollegeSports = _eventsCollection
        .where('category', isEqualTo: 'College Sports')
        .snapshots()
        .map(_eventListFromSnapshot);
    //notifyListeners();
  }

  void activateStudentStreams() {
    streamAcademic = _eventsCollection
        .where('category', isEqualTo: 'Academic')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamPolitical = _eventsCollection
        .where('category', isEqualTo: 'Political')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamMediaPublication = _eventsCollection
        .where('category', isEqualTo: 'Media & Publication')
        .snapshots()
        .map(_eventListFromSnapshot);
    //notifyListeners();
  }

  void activateFoodStreams() {
    streamFreeFood = _eventsCollection
        .where('category', isEqualTo: 'Free Food')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamMaristDining = _eventsCollection
        .where('category', isEqualTo: 'Marist Dining')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamOccasions = _eventsCollection
        .where('category', isEqualTo: 'Occasions')
        .snapshots()
        .map(_eventListFromSnapshot);
    //notifyListeners();
  }

  void activateGreekStreams() {
    streamFraternity = _eventsCollection
        .where('category', isEqualTo: 'greek')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamSorority = _eventsCollection
        .where('category', isEqualTo: 'greek')
        .snapshots()
        .map(_eventListFromSnapshot);

    streamRushes = _eventsCollection
        .where('category', isEqualTo: 'greek')
        .snapshots()
        .map(_eventListFromSnapshot);
    //notifyListeners();
  }

  Future<List<SearchResult>> shallowFetchQuery(String query) async {
    print('shallowFetchQuery Called');
    QuerySnapshot querySnap = await _searchEventsCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThan: query +'\uf8ff').getDocuments();
    return querySnap.documents
        .map(
          (doc) => SearchResult(
            ///Category converted to [STRING] from [STRING] in Firebase.
            newCategory: doc.data['category'] ?? '',

            ///Host converted to [STRING] from [STRING] in Firebase.
            newHost: doc.data['host'] ?? '',

            ///Title converted to [STRING] from [STRING] in Firebase.
            newTitle: doc.data['title'] ?? '',

            ///Location Converted to [] from [] in Firebase.
            newLocation: doc.data['location'] ?? '',
          ),
        )
        .toList();
  }

  Future<List<ClubEventData>> deepFetchQuery(String query) async {
    QuerySnapshot querySnap =
        await _eventsCollection.where('title', isEqualTo: query).getDocuments();
    return querySnap.documents.map((doc) {
      Timestamp tempRawStartDateAndTime = doc.data['rawStartDateAndTime'];
      Timestamp tempRawEndDateAndTime = doc.data['rawEndDateAndTime'];

      DateTime tempRawStartDateAndTimeToDateTime;
      DateTime tempRawEndDateAndTimeToDateTime;

      if (tempRawStartDateAndTime != null)
        tempRawStartDateAndTimeToDateTime = DateTime.fromMillisecondsSinceEpoch(
                tempRawStartDateAndTime.millisecondsSinceEpoch)
            .toUtc()
            .toLocal();
      else
        tempRawStartDateAndTimeToDateTime = null;

      if (tempRawEndDateAndTime != null)
        tempRawEndDateAndTimeToDateTime = DateTime.fromMillisecondsSinceEpoch(
                tempRawEndDateAndTime.millisecondsSinceEpoch)
            .toUtc()
            .toLocal();
      else
        tempRawEndDateAndTimeToDateTime = null;

      return ClubEventData(

          /// RawStartDate converted to [DATETIME] from [TIMESTAMP] in Firebase.
          newRawStartDateAndTime: tempRawStartDateAndTimeToDateTime ?? null,

          /// RawEndDate converted to [DATETIME] from [TIMESTAMP] in Firebase.
          newRawEndDateAndTime: tempRawEndDateAndTimeToDateTime ?? null,

          ///Category converted to [STRING] from [STRING] in Firebase.
          newCategory: doc.data['category'] ?? '',

          ///Host converted to [STRING] from [STRING] in Firebase.
          newHost: doc.data['host'] ?? '',

          ///Title converted to [STRING] from [STRING] in Firebase.
          newTitle: doc.data['title'] ?? '',

          ///Location Converted to [] from [] in Firebase.
          newLocation: doc.data['location'] ?? '',

          ///Room converted to [STRING] from [String] in Firebase.
          newRoom: doc.data['room'] ?? '',

          ///Summary converted to [STRING] from [STRING] in Firebase.
          newSummary: doc.data['summary'] ?? '',

          ///Highlights converted to [List<String>] from [List<dynamic>] in Firebase.
          newHighlights:
              List.from(doc.data['highlights']) ?? ['', '', '', '', ''],

          ///Implement Firebase Images.
          newImageFitCover: doc.data['imageFitCover'] ?? true,
          newImagePath: doc.data['imagePath'] ?? '');
    }).toList();
  }
} //class