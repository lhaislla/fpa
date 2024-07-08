import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Função que gera o hash do ID e da URL
String generateHash(String id, String url) {
  var bytes = utf8.encode('$id$url');
  var digest = sha256.convert(bytes);
  return digest.toString();
}

/// Função que verifica se o hash do ID e da URL mudou
bool hasHashChanged(String id, String url, String storedHash) {
  String currentHash = generateHash(id, url);
  return currentHash != storedHash;
}



