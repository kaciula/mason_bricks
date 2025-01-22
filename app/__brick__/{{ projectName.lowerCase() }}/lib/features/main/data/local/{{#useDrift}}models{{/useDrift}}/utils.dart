import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:encrypt/encrypt.dart';

class ListStringConverter extends TypeConverter<List<String>, String>
    with JsonTypeConverter2<List<String>, String, List<Object?>> {
  const ListStringConverter();

  @override
  List<Object?> toJson(List<String> value) => value;

  @override
  List<String> fromJson(List<Object?> json) => json.cast();

  @override
  List<String> fromSql(String fromDb) {
    return List<String>.from(jsonDecode(fromDb)).toList();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

class ListIntConverter extends TypeConverter<List<int>, String>
    with JsonTypeConverter2<List<int>, String, List<Object?>> {
  const ListIntConverter();

  @override
  List<Object?> toJson(List<int> value) => value;

  @override
  List<int> fromJson(List<Object?> json) => json.cast();

  @override
  List<int> fromSql(String fromDb) {
    return List.from(jsonDecode(fromDb))
        .map((it) => int.parse(it.toString()))
        .toList();
  }

  @override
  String toSql(List<int> value) {
    return jsonEncode(value);
  }
}

class EncryptedStringConverter extends TypeConverter<String, String>
    with JsonTypeConverter<String, String> {
  const EncryptedStringConverter();

  static late String encryptionKey;

  @override
  String fromSql(String fromDb) {
    return _decrypt(fromDb, encryptionKey: encryptionKey);
  }

  @override
  String toSql(String value) {
    return _encrypt(value, encryptionKey: encryptionKey);
  }
}

String _encrypt(String plainText, {required String encryptionKey}) {
  // Encrypting an empty string is not allowed
  if (plainText.isNotEmpty) {
    final Key key = Key.fromUtf8(encryptionKey);
    final Key b64key =
        Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    final Fernet fernet = Fernet(b64key);
    final Encrypter encrypter = Encrypter(fernet);

    final Encrypted encrypted = encrypter.encrypt(plainText);
    return encrypted.base64;
  } else {
    return plainText;
  }
}

String _decrypt(String encryptedText, {required String encryptionKey}) {
  // Encrypting an empty string is not allowed
  if (encryptedText.isNotEmpty) {
    final Key key = Key.fromUtf8(encryptionKey);
    final Key b64key =
        Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    final Fernet fernet = Fernet(b64key);
    final Encrypter encrypter = Encrypter(fernet);

    final Encrypted encrypted = Encrypted.fromBase64(encryptedText);
    final String decrypted = encrypter.decrypt(encrypted);
    return decrypted;
  } else {
    return encryptedText;
  }
}
