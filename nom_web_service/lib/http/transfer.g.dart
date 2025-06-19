// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal()
  ..nom = json['nom'] as String
  ..espece = json['espece'] as String
  ..continent = json['continent'] as String
  ..famille = json['famille'] as String;

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
  'nom': instance.nom,
  'espece': instance.espece,
  'continent': instance.continent,
  'famille': instance.famille,
};
