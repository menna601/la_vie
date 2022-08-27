import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie/utils/Networking.dart';

import '../model/product.dart';

class Api {
  static const Domain_Name = 'https://lavie.orangedigitalcenteregypt.com';
  static const Products = 'api/v1/products';
  static const Filters = 'api/v1/products/filters';
  static const Plants = 'api/v1/plants';
  static const Sign_In = 'api/v1/auth/signin';
  static const Sign_Up = 'api/v1/auth/signup';
  static const Forget_Password = 'api/v1/auth/forget-password';
  static const Reset_Password = 'api/v1/auth/reset-password';
  static const Verify_OTP = 'api/v1/auth/verify-otp';
  static const Sign_In_With_Google = 'api/v1/auth/google';
  static const Claim_Free_Seeds = 'api/v1/user/me/claimFreeSeeds';

  static Future<dynamic> signIn(String email, String password) async {
    return await NetworkHelper.sendPostRequest(
        Sign_In, {'email': email, 'password': password});
  }

  static void signUp(Map<String, dynamic> data) {
    NetworkHelper.sendPostRequest(Sign_Up, data);
  }

  static Future<dynamic> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final name = googleUser.displayName;
      final data = {
        'id': googleUser.id,
        'email': googleUser.email,
        'firstName': name != null ? name.split(' ')[0] : '',
        'lastName': name != null ? name.split(' ')[1] : '',
        'picture': googleUser.photoUrl ?? ''
      };
      return await NetworkHelper.sendPostRequest(Sign_In_With_Google, data);
    }
  }

  static addAddress(String address, String accessToken) async {
    await NetworkHelper.sendPostRequest(Claim_Free_Seeds, {'address': address},
        {'Authorization': 'Bearer $accessToken'});
  }

  static Future<List<Product>> getProducts(String accessToken) async {
    final result = await NetworkHelper.sendGetRequest(
        Products, null, {'Authorization': 'Bearer $accessToken'});
    var data = result['data'] as List;
    return data.map((element) => Product.fromJson(element)).toList();
  }

  static getCategories(String accessToken) async {
    final result = await NetworkHelper.sendGetRequest(
        Filters, null, {'Authorization': 'Bearer $accessToken'});
    var data = result['data'];
    return data;
  }

  static sendOTP(String email) async {
    await NetworkHelper.sendPostRequest(Forget_Password, {'email': email});
  }

  static verifyOTP(String email, String password) async {
    await NetworkHelper.sendPostRequest(
        Verify_OTP, {'email': email, 'otp': password});
  }

  static resetPassword(String email, String password, String otp) async {
    await NetworkHelper.sendPostRequest(
        Reset_Password, {'email': email, 'password': password, 'otp': otp});
  }
}
