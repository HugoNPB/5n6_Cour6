import 'package:dio/dio.dart';
import 'package:nom_web_service/http/transfer.dart';

Future<List<Animal>> getAnimals(String continent, String famille) async {
  try {
    Response respose;
    if (famille == '') {
      respose = await Dio().get(
        'http://10.0.2.2:8080/exam/animaux/$continent',
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
    } else {
      respose = await Dio().get(
        'http://10.0.2.2:8080/exam/animaux/$continent?famille=$famille',
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );
    }

    print(respose);
    var listeJSON = respose.data as List;
    var listeReponse = listeJSON.map((elementJSON) {
      return Animal.fromJson(elementJSON);
    }).toList();
    return listeReponse;
  } catch (e) {
    print(e);
    rethrow;
  }
}
