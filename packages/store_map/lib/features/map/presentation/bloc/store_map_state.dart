// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';

class StoreMapState {
  final bool isLoading;
  final List<StoreMapModel> stores;
  final StoreMapModel? selectedStore;
  const StoreMapState({
    this.isLoading = false,
    this.stores = const [],
    this.selectedStore,
  });

  StoreMapState copyWith({
    bool? isLoading,
    List<StoreMapModel>? stores,
    StoreMapModel? selectedStore,
  }) {
    return StoreMapState(
      isLoading: isLoading ?? this.isLoading,
      stores: stores ?? this.stores,
      selectedStore: selectedStore ?? this.selectedStore,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isLoading': isLoading,
      'stores': stores.map((x) => x.toMap()).toList(),
      'selectedStore': selectedStore?.toMap(),
    };
  }

  factory StoreMapState.fromMap(Map<String, dynamic> map) {
    return StoreMapState(
      isLoading: map['isLoading'] as bool,
      stores: List<StoreMapModel>.from(
        (map['stores'] as List<int>).map<StoreMapModel>(
          (x) => StoreMapModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      selectedStore: map['selectedStore'] != null
          ? StoreMapModel.fromMap(map['selectedStore'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreMapState.fromJson(String source) =>
      StoreMapState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StoreMapState(isLoading: $isLoading, stores: $stores, selectedStore: $selectedStore)';

  @override
  bool operator ==(covariant StoreMapState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading &&
        listEquals(other.stores, stores) &&
        other.selectedStore == selectedStore;
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^ stores.hashCode ^ selectedStore.hashCode;
}
