// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class AiChatBot extends StatefulWidget {
//   const AiChatBot({Key? key}) : super(key: key);

//   @override
//   State<AiChatBot> createState() => _AiChatBotState();
// }

// class _AiChatBotState extends State<AiChatBot> {
//   final TextEditingController _inputController = TextEditingController();
//   String _chatHistory = '';

//   Future<void> _sendUserMessage() async {
//     String userInput = _inputController.text;

//     try {
//       // Make API request to GPT-3
//       String response = await getGPT3Response(userInput);

//       // Update chat history
//       setState(() {
//         _chatHistory += 'User: $userInput\n';
//         _chatHistory += 'AI: $response\n\n';
//       });
//     } catch (e) {
//       // Handle API request error
//       // print();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Error: $e"),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }

//     // Clear input field
//     _inputController.clear();
//   }

//   Future<String> getGPT3Response(String userInput) async {
//     // const apiKey = 'sk-jXtBOI9bEcYYDTJzDtT4DhruvT3BlbkFJoIlEeYDiURW0mZ4rzmdJ';
//     const endpoint = 'https://api.openai.com/v1/engines/ada/completions';

//     final response = await http.post(
//       Uri.parse(endpoint),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $apiKey',
//       },
//       body: jsonEncode({
//         'prompt': userInput,
//         'max_tokens': 200,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final generatedText = data['choices'][0]['text'];
//       return generatedText;
//     } else {
//       // print("chatresponse" + response.body);
//       throw Exception('Failed to get response from GPT-3');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("AI Sarthi"),
//       ),
//       body: Column(
//         children: [
//           // Chat History Display
//           Expanded(
//             child: SingleChildScrollView(
//               reverse: true,
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 _chatHistory,
//                 style: const TextStyle(fontSize: 16.0),
//               ),
//             ),
//           ),
//           // User Input
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _inputController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: _sendUserMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
