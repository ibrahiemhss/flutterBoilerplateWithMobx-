// @dart=2.9
import 'dart:async';

class Advertisement {
  int id;
  String type;
  String media;
  int duration, sortOrder;
  String arabicDescription;
  String englishDescription;
  String kurdishDescription;

  Advertisement(
      {this.id,
      this.type,
      this.media,
      this.duration,
      this.sortOrder,
      this.arabicDescription,
      this.englishDescription,
      this.kurdishDescription});

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return new Advertisement(
      id: json['id'] as int,
      type: json['type'] as String,
      media: json['media'] as String,
      duration: json['duration'] as int,
      sortOrder: json['sortOrder'] as int,
      arabicDescription: json['arabicDescription'] as String,
      englishDescription: json['englishDescription'] as String,
      kurdishDescription: json['kurdishDescription'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['type'] = type;
    map['media'] = media;
    map['duration'] = duration;
    map['sortOrder'] = sortOrder;
    map['arabicDescription'] = arabicDescription;
    map['englishDescription'] = englishDescription;
    map['kurdishDescription'] = kurdishDescription;

    return map;
  }

  Advertisement.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        type = map['type'],
        media = map['media'],
        duration = map['duration'],
        sortOrder = map['sortOrder'],
        arabicDescription = map['arabicDescription'],
        englishDescription = map['englishDescription'],
        kurdishDescription = map['kurdishDescription'];
}

abstract class AdsRepository {
  Future<List<Advertisement>> fetchCities(int type);
}
