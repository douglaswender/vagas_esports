import 'dart:convert';

import 'package:vagas_esports/src/shared/data/models/user_model.dart';

class VacancyModel {
  final UserModel user;
  final String? rank;
  final String? contact;
  VacancyModel({
    required this.user,
    this.rank,
    this.contact,
  });

  VacancyModel copyWith({
    UserModel? user,
    String? rank,
    String? contact,
  }) {
    return VacancyModel(
      user: user ?? this.user,
      rank: rank ?? this.rank,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'rank': rank,
      'contact': contact,
    };
  }

  factory VacancyModel.fromMap(Map<String, dynamic> map) {
    return VacancyModel(
      user: UserModel.fromMap(map['user']),
      rank: map['rank'],
      contact: map['contact'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VacancyModel.fromJson(String source) =>
      VacancyModel.fromMap(json.decode(source));

  @override
  String toString() => 'Vacancy(user: $user, rank: $rank, contact: $contact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VacancyModel &&
        other.user == user &&
        other.rank == rank &&
        other.contact == contact;
  }

  @override
  int get hashCode => user.hashCode ^ rank.hashCode ^ contact.hashCode;
}
