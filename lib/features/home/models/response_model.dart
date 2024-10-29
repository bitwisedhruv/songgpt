// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseModel {
  final String songImageUrl;
  final String songName;
  final String artistName;
  final String genre;
  final String songDuration;
  final double endTime;
  final DateTime timeSent;
  final String lyrics;
  final String response;
  ResponseModel({
    required this.songImageUrl,
    required this.songName,
    required this.artistName,
    required this.genre,
    required this.songDuration,
    required this.endTime,
    required this.timeSent,
    required this.lyrics,
    required this.response,
  });

  ResponseModel copyWith({
    String? songImageUrl,
    String? songName,
    String? artistName,
    String? genre,
    String? songDuration,
    double? endTime,
    DateTime? timeSent,
    String? lyrics,
    String? response,
  }) {
    return ResponseModel(
      songImageUrl: songImageUrl ?? this.songImageUrl,
      songName: songName ?? this.songName,
      artistName: artistName ?? this.artistName,
      genre: genre ?? this.genre,
      songDuration: songDuration ?? this.songDuration,
      endTime: endTime ?? this.endTime,
      timeSent: timeSent ?? this.timeSent,
      lyrics: lyrics ?? this.lyrics,
      response: response ?? this.response,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'songImageUrl': songImageUrl,
      'songName': songName,
      'artistName': artistName,
      'genre': genre,
      'songDuration': songDuration,
      'endTime': endTime,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'lyrics': lyrics,
      'response': response,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      songImageUrl: map['songImageUrl'] as String,
      songName: map['songName'] as String,
      artistName: map['artistName'] as String,
      genre: map['genre'] as String,
      songDuration: map['songDuration'] as String,
      endTime: map['endTime'] as double,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      lyrics: map['lyrics'] as String,
      response: map['response'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseModel(songImageUrl: $songImageUrl, songName: $songName, artistName: $artistName, genre: $genre, songDuration: $songDuration, endTime: $endTime, timeSent: $timeSent, lyrics: $lyrics, response: $response)';
  }

  @override
  bool operator ==(covariant ResponseModel other) {
    if (identical(this, other)) return true;

    return other.songImageUrl == songImageUrl &&
        other.songName == songName &&
        other.artistName == artistName &&
        other.genre == genre &&
        other.songDuration == songDuration &&
        other.endTime == endTime &&
        other.timeSent == timeSent &&
        other.lyrics == lyrics &&
        other.response == response;
  }

  @override
  int get hashCode {
    return songImageUrl.hashCode ^
        songName.hashCode ^
        artistName.hashCode ^
        genre.hashCode ^
        songDuration.hashCode ^
        endTime.hashCode ^
        timeSent.hashCode ^
        lyrics.hashCode ^
        response.hashCode;
  }
}
