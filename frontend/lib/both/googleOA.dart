import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleOA extends ChangeNotifier {
  static final auth = GoogleSignIn(scopes: ['email']);

  GoogleSignInAccount? _account;
  GoogleSignInAccount? get account => _account;
  Future signWGoogle() async {
    final GoogleSignInAccount? account = await auth.signIn();

    if (account != null) {
      print("email = ${account.email}");
      print("name = ${account.displayName}");
      _account = account;
      notifyListeners();
    }
  }
}
