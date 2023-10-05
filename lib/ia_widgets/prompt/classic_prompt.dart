import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:dockable/constants.dart';



class ResponseAGI {
  final List<dynamic> responseSet;

  const ResponseAGI({required this.responseSet});

  factory ResponseAGI.fromJson(Map<String, dynamic> json) {
    return ResponseAGI(
      responseSet: json['responseSet'],
    );
  }
}

class ClassicPrompt extends StatefulWidget {
  const ClassicPrompt({super.key});

  @override
  _ClassicPromptPageState createState() => _ClassicPromptPageState();
}

class _ClassicPromptPageState extends State<ClassicPrompt> {
  TextEditingController _inputController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  final List<ChatMessage> _messages = [];
  List<ResponseAGI> _responsesAI = [];
  ScrollController controller = ScrollController();

  //============Params=================================================================
  String language = 'fr';
  bool languageBool = true;
  //===================================================================================

  
  void _sendMessage(String message) async{
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: message, isUser: true));
    });
    controller.animateTo(
      (1000 * _messages.length).toDouble(), 
      duration: const Duration(milliseconds:500),
      curve: Curves.ease
      );

    //===========================================================

    final corpusKey = {
      'customerId': '2000515465', 
      'corpusId' : 2
    };
    final querySummary = {
      'summarizerPromptName': 'vectara-summary-ext-v1.2.0', 
      'maxSummarizedResults' : 2,
      'responseLang' : language //zh chinois
    };
    final contextConfig = {
      "charsBefore": 50,
      "charsAfter": 50,
      "sentencesBefore": 5,
      "sentencesAfter": 5,
      "startTag": "<b>",
      "endTag": "</b>"
    };
    final queryObj = {
      'query': message, 
      'start': 0, 
      'numResults': 10,
      'contextConfig': contextConfig,
      'corpusKey': [corpusKey],
      'summary' : [querySummary]
    };
    final queryToEncode = {'query': [queryObj]};
    print(jsonEncode(queryToEncode));
    
    final response = await http.post(
      Uri.parse('https://api.vectara.io/v1/query'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
        'customer-id' : '2000515465',
        'x-api-key' : 'zqt_dz1xieLWQ9ZJzdpzkudH7JrxpkCQW1V4kjnGSQ',
      },
      body: jsonEncode(queryToEncode),
    );
    if (response.statusCode == 200) {
      final uncoded = jsonDecode(response.body);
      final decodedUtf = Utf8Decoder().convert(response.bodyBytes);
      // final decodedUtf = utf8.decode(response.bodyBytes);
      final responseFactored = ResponseAGI.fromJson(json.decode(decodedUtf));

      // final file = File('/mnt/nfs/homes/ael-youb/flutter/dockable/reponseAGI.json');
      // await file.writeAsString(response.body);

      print(decodedUtf);
      _responsesAI.add(responseFactored);
      _simulateResponseFromBot(responseFactored.responseSet[0]["summary"][0]["text"], responseFactored);

    } else {
      //throw Exception('Failed call to sauce magique API');
      print(response.statusCode);
      // print(jsonDecode(response.body));
    }

    //===========================================================

    // REWORK THE SCROLLING CONTROLLER IF WE KEEPING THIS SOLUTION
    //_simulateResponseFromBot(message);
    controller.animateTo(
      (100 * _messages.length).toDouble(), 
      duration: const Duration(milliseconds:500),
      curve: Curves.ease
      );
  }

  // void _sendMessage(String message) async{
  //   if (message.trim().isEmpty) return;

  //   setState(() {
  //     _messages.add(ChatMessage(text: message, isUser: true, response: null,));
  //   });
  //   controller.animateTo(
  //     (1000 * _messages.length).toDouble(), 
  //     duration: const Duration(milliseconds:500),
  //     curve: Curves.ease
  //     );

  //   //===========================================================

  //   final queryToEncode = {'query': message};

  //   print(jsonEncode(queryToEncode));
    
  //   final response = await http.post(
  //     Uri.http('api.docable.fr:8000', '/question'),
  //     headers: <String, String> {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization' : 'Bearer ' + userToken,
  //     },
  //     body: jsonEncode(queryToEncode),
  //   );
  //   if (response.statusCode == 200) {
  //     final uncoded = jsonDecode(response.body);
  //     final decodedUtf = Utf8Decoder().convert(response.bodyBytes);
  //     // final decodedUtf = utf8.decode(response.bodyBytes);
  //     final responseFactored = ResponseAGI.fromJson(json.decode(decodedUtf));

  //     // final file = File('/mnt/nfs/homes/ael-youb/flutter/dockable/reponseAGI.json');
  //     // await file.writeAsString(response.body);

  //     print(decodedUtf);
  //     _responsesAI.add(responseFactored);
  //     _simulateResponseFromBot(responseFactored.responseSet[0]["summary"][0]["text"], responseFactored);

  //   } else {
  //     //throw Exception('Failed call to sauce magique API');
  //     print(response.statusCode);
  //     // print(jsonDecode(response.body));
  //   }

  //   //===========================================================

  //   // REWORK THE SCROLLING CONTROLLER IF WE KEEPING THIS SOLUTION
  //   //_simulateResponseFromBot(message);
  //   controller.animateTo(
  //     (100 * _messages.length).toDouble(), 
  //     duration: const Duration(milliseconds:500),
  //     curve: Curves.ease
  //     );
  // }

  void _simulateResponseFromBot(String magicSauce, ResponseAGI response) {
    
    setState(() {
      _messages.add(ChatMessage(text: magicSauce, isUser: false, response: response,));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller,
              shrinkWrap: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('eng'),
                Switch(
                  // This bool value toggles the switch.
                  value: languageBool,
                  activeColor: primaryColor,
                  inactiveTrackColor: const Color.fromARGB(255, 53, 123, 55),
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      languageBool = value;
                      if (value == true) {
                        language = 'fr';
                      }
                      else {
                        language = 'en';
                      }
                    });
                  },
                ),
                Text('fr'),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    focusNode: myFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Selectionnez une doc et posez votre question',
                    ),
                    onSubmitted: (val) {
                      setState(() {
                        _sendMessage(_inputController.text);
                      });
                      _inputController.clear();
                      myFocusNode.requestFocus();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_inputController.text);
                    _inputController.clear();
                    myFocusNode.requestFocus();
                  },
                ),
              ],
            ),
          ),
        ],
    );
  }
}


class ResponseMessage extends StatefulWidget{
  final ResponseAGI? response;
  final String text;
  const ResponseMessage({super.key, required this.response, required this.text});

  @override
  _ResponseMessageState createState() => _ResponseMessageState();
}

class _ResponseMessageState extends State<ResponseMessage> {
  
  void _showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlay1;
    overlay1 = OverlayEntry(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //modify this to not obfuscate all the window (UX user clicks out of overlay to close it)
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.black.withOpacity(0.8),
                  child: Material(
                    color: Colors.transparent,
                    child: Text(widget.response!.responseSet[0]["response"][0]["text"],
                        style: TextStyle(
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });

    overlayState.insertAll([overlay1]);

    await Future.delayed(const Duration(seconds: 10));

    overlay1.remove();

  }

  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        _showOverlay(context);
      },
      child : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 16),
        ),
      )
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  ResponseAGI? response;

  ChatMessage({super.key, required this.text, required this.isUser, this.response});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(8),
        color: isUser ? Colors.blue : Colors.black,
        child: isUser ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ) 
        : 
        ResponseMessage(response: response, text: text)
      ),
    );
  }
}