// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:store_map/features/map/data/models/lat_long.dart';

class StoreMapModel {
  final String id;
  final String name;
  final String address;
  final String workingSchedule;
  final LatLong latLong;
  final List<String> imageUrls;
  final String? openingAnnouncement;
  final bool isNotificationEnabled;
  final String phoneNumber;

  StoreMapModel({
    required this.id,
    required this.name,
    required this.address,
    required this.workingSchedule,
    required this.latLong,
    required this.imageUrls,
    this.openingAnnouncement,
    required this.isNotificationEnabled,
    required this.phoneNumber,
  });

  StoreMapModel copyWith({
    String? id,
    String? name,
    String? address,
    String? workingSchedule,
    LatLong? latLong,
    List<String>? imageUrls,
    String? openingAnnouncement,
    bool? isNotificationEnabled,
    String? phoneNumber,
  }) {
    return StoreMapModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      workingSchedule: workingSchedule ?? this.workingSchedule,
      latLong: latLong ?? this.latLong,
      imageUrls: imageUrls ?? this.imageUrls,
      openingAnnouncement: openingAnnouncement ?? this.openingAnnouncement,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'workingSchedule': workingSchedule,
      'latLong': latLong.toMap(),
      'imageUrls': imageUrls,
      'openingAnnouncement': openingAnnouncement,
      'isNotificationEnabled': isNotificationEnabled,
      'phoneNumber': phoneNumber,
    };
  }

  factory StoreMapModel.fromMap(Map<String, dynamic> map) {
    return StoreMapModel(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      workingSchedule: map['workingSchedule'] as String,
      latLong: LatLong.fromMap(map['latLong'] as Map<String, dynamic>),
      imageUrls: List<String>.from((map['imageUrls'] as List<String>)),
      openingAnnouncement: map['openingAnnouncement'] != null
          ? map['openingAnnouncement'] as String
          : null,
      isNotificationEnabled: map['isNotificationEnabled'] as bool,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreMapModel.fromJson(String source) =>
      StoreMapModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreMapModel(id: $id, name: $name, address: $address, workingSchedule: $workingSchedule, latLong: $latLong, imageUrls: $imageUrls, openingAnnouncement: $openingAnnouncement, isNotificationEnabled: $isNotificationEnabled, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant StoreMapModel other) {
    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.workingSchedule == workingSchedule &&
        other.latLong == latLong &&
        listEquals(other.imageUrls, imageUrls) &&
        other.openingAnnouncement == openingAnnouncement &&
        other.isNotificationEnabled == isNotificationEnabled &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        workingSchedule.hashCode ^
        latLong.hashCode ^
        imageUrls.hashCode ^
        openingAnnouncement.hashCode ^
        isNotificationEnabled.hashCode ^
        phoneNumber.hashCode;
  }
}
