import 'api.dart';

class Actualite {
  Future<dynamic> getActualites() {
    ApiAnfiya api = new ApiAnfiya();

    return api.get("anfiyacom.octra.io", "/api/information_general");
  }
}
