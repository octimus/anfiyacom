import 'api.dart';

class CovidData {
  Future<dynamic> getInfoGeneral() {
    ApiAnfiya api = new ApiAnfiya();

    return api.get("anfiyacom.octra.io", "/api/information_covid");
  }

  Future<dynamic> getContamines() {
    ApiAnfiya api = new ApiAnfiya();

    return api.get("anfiyacom.octra.io", "/api/utilisateur");
  }

  Future<dynamic> getCenters() {
    ApiAnfiya api = new ApiAnfiya();

    return api.get("anfiyacom.octra.io", "/api/centre_depistage");
  }
}
