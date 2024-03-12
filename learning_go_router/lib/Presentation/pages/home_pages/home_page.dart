import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';
import 'package:learning_go_router/Presentation/widgets/my_elevated_button.dart';
import 'package:learning_go_router/Presentation/widgets/my_expandable_text.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _text = TextEditingController();
  final _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              MyExpandableText(text: _text.text),

              const SizedBox(height: 10),

              Row(children: [
                TextButton(child: Text(_phone.text), onPressed: (){
                  print("${_phone.text} pressed");

                  try {
                    int.parse(_phone.text);
                    launchUrl(Uri.parse("tel:${_phone.text}"));
                  } catch(e) {
                    print("Error is $e");

                  }
                }),
              ]),
              
              const SizedBox(
                height: 48,
              ),
              TextField(
                controller: _text,
                maxLines: 5,
                // minLines: 5,
                decoration: const InputDecoration(hintText: "Write post"),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.maxFinite,
                child: MyElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    text: "Post"),
              ),

              const SizedBox(height: 32),

              TextField(
                controller: _phone,
                decoration: const InputDecoration(hintText: "Enter phone number"),
              ),

              const SizedBox(height: 24),

              MyElevatedButton(
                onPressed: () {
                  setState((){});
                },
                text: "Update phone number"
              )
            ],
          ),
        ),
      ),
    );
  }
}
