import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserService {
  Future<dynamic> getTaxis(dynamic uids) async {
    var url = Uri.https('octra.io', '/alhayat/action.php', {
      "action": "get_taxis",
      "uids": uids.toString(),
    });
    return await http.get(url);
  }

  Future<Response> update(useR) {
    print(useR);
    print("in user service");
    var body = {
      "action": "update_user",
      "avatar": useR["avatar"] != null ? useR["avatar"] : "",
      "domicile": useR["domicile"] != null ? useR["domicile"] : "",
      "email": useR["email"] != null ? useR["email"] : "",
      "nom_prenom": useR["nom_prenom"] != null ? useR["nom_prenom"] : "",
    };

    return http.post(Uri.https("octra.io", "octra.io/alhayat/action.php"),
        body: body);
  }
}
