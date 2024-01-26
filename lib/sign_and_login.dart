// import 'package:bhagwat_gita_app/home.dart';
// import 'package:flutter/material.dart';
// import 'database_helper.dart';
// import 'database_model.dart';

// class SignInScreen extends StatelessWidget {
//   // SignInScreen({required this.user, this.key}) : super(key: key);
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign In')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: usernameController,
//               decoration: const InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(labelText: 'Password'),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 String username = usernameController.text;
//                 String password = passwordController.text;

//                 User user = User(id: 0, username: username, password: password);

//                 DBHelper dbHelper = DBHelper();
//                 int result = await dbHelper.insertUser(user);

//                 if (result > 0) {
//                   // Sign-in successful, navigate to the login screen
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => LoginScreen()),
//                   // );
//                   LoginScreen();

//                   // Display a success message
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Sign-in successful'),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );

//                   // Clear text fields after successful sign-in
//                   usernameController.clear();
//                   passwordController.clear();
//                 } else {
//                   // Sign-in failed, handle accordingly
//                   print('Sign-in failed');
//                 }
//               },
//               child: const Text('Sign In'),
//             ),
//             const SizedBox(height: 16.0),
//             TextButton(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 // );
//                 LoginScreen();
//               },
//               child: const Text('Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   final TextEditingController loginUsernameController = TextEditingController();
//   final TextEditingController loginPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: loginUsernameController,
//               decoration: const InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: loginPasswordController,
//               obscureText: true,
//               decoration: const InputDecoration(labelText: 'Password'),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 ElevatedButton(
//                   onPressed: () async {
//                     String loginUsername = loginUsernameController.text;
//                     String loginPassword = loginPasswordController.text;

//                     DBHelper dbHelper = DBHelper();
//                     User? user =
//                         await dbHelper.getUser(loginUsername, loginPassword);

//                     if (user != null) {
//                       // Login successful, navigate to the home screen or another screen
//                       // You can pass the user information to the next screen if needed
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomeScreen(user: user),
//                         ),
//                       );

//                       // Clear text fields after successful login
//                       loginUsernameController.clear();
//                       loginPasswordController.clear();
//                     } else {
//                       // Login failed, show an error message
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content:
//                               Text('Invalid credentials. Please try again.'),
//                           duration: Duration(seconds: 2),
//                         ),
//                       );

//                       // You can choose to clear the password field on failed login
//                       loginPasswordController.clear();
//                     }
//                   },
//                   child: const Text('Login'),
//                 );
//               },
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 16.0),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Don\'t have an account? Sign In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
