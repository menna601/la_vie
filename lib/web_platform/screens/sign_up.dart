// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:la_vie/constansts.dart';
// import 'package:provider/provider.dart';
//
// import '../../model/user.dart';
// import '../Component/upper_bar.dart';
//
// class SignUp extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<AppUser>(context, listen: false);
//
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 118),
//         child: DefaultTabController(
//           length: 2,
//           child: Column(
//             children: [
//               UpperBar(),
//               TabBar(
//                   labelColor: Color(0xFF1ABC00),
//                   unselectedLabelColor: Color(0xFF8A8A8A),
//                   indicatorSize: TabBarIndicatorSize.label,
//                   indicatorColor: Color(0xFF1ABC00),
//                   tabs: [
//                     Tab(text: 'Sign up'),
//                     Tab(text: 'Login'),
//                   ]),
//               Expanded(
//                   child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 200),
//                 child: TabBarView(children: [
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(height: 30),
//                         Row(
//                           children: [
//                             Expanded(child: CustomField(label: 'First Name',onChanged: (value){
//                               fName = value;
//                             },)),
//                             SizedBox(width: 96),
//                             Expanded(child: CustomField(label: 'Last Name',onChanged: (value){
//                             lName = value;
//                             }))
//                           ],
//                         ),
//                         CustomField(label: 'Email',onChanged: (value){
//         email = value;
//         }),
//                         CustomField(label: 'Password',onChanged: (value){
//                           password = value;
//                         }),
//                         CustomField(label: 'Password',onChanged: (value){
//                           passwordCheck = value;
//                         }),
//                         SizedBox(height: 10),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,
//                           child: TextButton(
//                             onPressed: () {
//                               Map<String, dynamic> data = {
//                                 'firstName': fName,
//                                 'lastName': lName,
//                                 'email': email,
//                                 'password': password
//                               };
//                               user.signUp(data);
//                             },
//                             child: Text('Sign up'),
//                             style: TextButton.styleFrom(
//                                 backgroundColor: Color(0xFF1ABC00),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('Already have an account? '),
//                             TextButton(onPressed: () {}, child: Text('Sign in'))
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             Expanded(child: Divider()),
//                             Text('or continue with'),
//                             Expanded(child: Divider())
//                           ],
//                         ),
//                         SizedBox(height: 30),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: SizedBox(
//                                 height: 55,
//                                 child: TextButton.icon(
//                                     onPressed: () {},
//                                     icon: SvgPicture.asset('svg/google.svg'),
//                                     label: Padding(
//                                         padding: EdgeInsets.only(left: 25),
//                                         child: Text('Continue with Google')),
//                                     style: TextButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             side: BorderSide(
//                                                 color: Color(0xFF1ABC00))))),
//                               ),
//                             ),
//                             SizedBox(width: 100),
//                             Expanded(
//                               child: SizedBox(
//                                 height: 55,
//                                 child: TextButton.icon(
//                                     onPressed: () {},
//                                     icon: SvgPicture.asset('svg/facebook.svg'),
//                                     label: Padding(
//                                         padding: EdgeInsets.only(left: 25),
//                                         child: Text('Continue with Facebook')),
//                                     style: TextButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             side: BorderSide(
//                                                 color: Color(0xFF1ABC00))))),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         CustomField(label: 'Email'),
//                         CustomField(label: 'Password'),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ListTile(
//                                 contentPadding: EdgeInsets.zero,
//                                 leading: Checkbox(
//                                   value: false,
//                                   onChanged: (val) {},
//                                 ),
//                                 title: Text('Remember me'),
//                               ),
//                             ),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text('Forget password ?'))
//                           ],
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,
//                           child: TextButton(
//                             onPressed: () async {
//                               final isLogged = await user.signIn(
//                                   'mnemo72@yahoo.com', 'Helloworld123');
//                               if (isLogged) {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (BuildContext context) =>
//                                             Container()));
//                               }
//                             },
//                             child: Text('Login'),
//                             style: TextButton.styleFrom(
//                                 backgroundColor: Color(0xFF1ABC00),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('Don\'t have an account? '),
//                             TextButton(onPressed: () {}, child: Text('Sign up'))
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(child: Divider()),
//                             Text('or continue with'),
//                             Expanded(child: Divider())
//                           ],
//                         ),
//                         SizedBox(height: 30),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: SizedBox(
//                                 height: 55,
//                                 child: TextButton.icon(
//                                     onPressed: () async {
//                                       final isLogged =
//                                           await user.signInWithGoogle();
//                                       print(isLogged);
//                                       if (isLogged) {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder:
//                                                     (BuildContext context) =>
//                                                         Container()));
//                                       }
//                                     },
//                                     icon: SvgPicture.asset('svg/google.svg'),
//                                     label: Padding(
//                                         padding: EdgeInsets.only(left: 55),
//                                         child: Text('Continue with Google')),
//                                     style: TextButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             side: BorderSide(
//                                                 color: Color(0xFF1ABC00))))),
//                               ),
//                             ),
//                             Expanded(
//                               child: SizedBox(
//                                 height: 55,
//                                 child: TextButton.icon(
//                                     onPressed: () {},
//                                     icon: SvgPicture.asset('svg/facebook.svg'),
//                                     label: Padding(
//                                         padding: EdgeInsets.only(left: 55),
//                                         child: Text('Continue with Facebook')),
//                                     style: TextButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             side: BorderSide(
//                                                 color: Color(0xFF1ABC00))))),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ]),
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
