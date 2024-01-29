import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

enum AuthType { email, phone, google, apple, anonymous }

class UserModel {
  final String? id;
  final String? email;
  final String? name;
  final String? lastName;
  final String? profilePictureUrl;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String? providerId;
  final AuthType? provider;
  final String? notificationToken;
  final String? selectedChild;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.profilePictureUrl,
    this.updatedAt,
    this.createdAt,
    this.provider,
    this.providerId,
    this.notificationToken,
    this.selectedChild,
    this.lastName,
  });

  factory UserModel.fromMap(dynamic data) {
    if (data is Map) {
      return UserModel(
        selectedChild: data["selectedChild"] as String?,
        id: data["id"] as String?,
        lastName: data["lastName"] as String?,
        notificationToken: data['notificationToken'] as String?,
        name: data["name"] as String?,
        email: data["email"] as String?,
        profilePictureUrl: data["profilePictureUrl"] as String?,
        updatedAt: data["updatedAt"] != null
            ? (data["updatedAt"] is Timestamp
                ? (data["updatedAt"] as Timestamp).toDate()
                : DateTime.tryParse(data["updatedAt"].toString()))
            : null,
        createdAt: data["createdAt"] != null
            ? (data["createdAt"] is Timestamp
                ? (data["createdAt"] as Timestamp).toDate()
                : DateTime.tryParse(data["createdAt"].toString()))
            : null,
        provider: AuthType.values.firstWhereOrNull(
          (element) => element.name == data["provider"]?.toString(),
        ),
        providerId: data["provider_id"] as String?,
      );
    } else {
      return UserModel();
    }
  }

  factory UserModel.fromDocument(DocumentSnapshot document) {
    final data = document.data();
    if (data is Map) {
      data['id'] = document.id;
    }
    return UserModel.fromMap(data);
  }

  Map<String, dynamic> toDocument() {
    final Map<String, dynamic> map = {};
    map['selectedChild'] = selectedChild;
    map['lastName'] = lastName;
    map['notificationToken'] = notificationToken;
    map["provider_id"] = providerId;
    map["provider"] = provider?.name;
    map["name"] = name;
    map["email"] = email;
    map["profilePictureUrl"] = profilePictureUrl;
    map["updatedAt"] = updatedAt.toString();
    map["createdAt"] = createdAt.toString();
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = toDocument();
    map["id"] = id;
    return map;
  }

  UserModel copyWith({
    String? selectedChild,
    String? notificationToken,
    int? userCredit,
    String? id,
    String? email,
    String? name,
    String? profilePictureUrl,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? providerId,
    AuthType? provider,
  }) {
    return UserModel(
      selectedChild: selectedChild ?? this.selectedChild,
      notificationToken: notificationToken ?? this.notificationToken,
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      providerId: providerId ?? this.providerId,
      provider: provider ?? this.provider,
    );
  }
}
