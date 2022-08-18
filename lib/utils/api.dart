import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie/utils/Networking.dart';

class Api {
  static const Sign_In = 'api/v1/auth/signin';
  static const Sign_Up = 'api/v1/auth/signup';
  static const Sign_In_With_Google = 'api/v1/auth/google';

  static Future<dynamic> signIn(String email, String password) async {
    return await NetworkHelper.sendPostRequest(
        Sign_In, {'email': email, 'password': password});
  }

  static void signUp(Map<String, dynamic> data) {
    NetworkHelper.sendPostRequest(Sign_Up, data);
  }

  static Future<dynamic> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final authHeaders = await googleUser!.authHeaders;
    final auth = await googleUser.authentication;
    print(googleUser);
    print(authHeaders);
    print(auth.accessToken);
    print(auth.idToken);
    // return await NetworkHelper.sendGetRequest(
    //     Sign_In_With_Google, {'access_token': auth?.accessToken}, authHeaders);
  }
}
