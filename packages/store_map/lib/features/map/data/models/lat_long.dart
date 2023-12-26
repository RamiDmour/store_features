import 'dart:convert';

class LatLong {
  final double latitude;
  final double longitude;

  const LatLong(this.latitude, this.longitude);

  @override
  String toString() => 'LatLong(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LatLong &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  LatLong copyWith({
    double? latitude,
    double? longitude,
  }) {
    return LatLong(
      latitude ?? this.latitude,
      longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LatLong.fromMap(Map<String, dynamic> map) {
    return LatLong(
      map['latitude']?.toDouble() ?? 0.0,
      map['longitude']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLong.fromJson(String source) =>
      LatLong.fromMap(json.decode(source));
}
