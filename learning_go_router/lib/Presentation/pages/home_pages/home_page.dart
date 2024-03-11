import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';
import 'package:learning_go_router/Presentation/widgets/my_elevated_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _text = TextEditingController();

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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyExpandableText extends StatelessWidget {
  const MyExpandableText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      maxLines: 5,
      collapseOnTextTap: true,
      onUrlTap: (url) {
        print("Url $url tapped");
      },
      urlStyle: TextStyle(
        color: Colors.blue.shade300,
      ),
      linkStyle: TextStyle(
        color: Colors.grey.shade300,
      ),
      expandOnTextTap: true,
      text,
      expandText: "read more",
      hashtagStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      onHashtagTap: (value) {
        print("Hashtag $value tapped");
      },
      mentionStyle: TextStyle(color: Colors.blue),
      onMentionTap: (value) {
        print("Mention: $value tapped");
      },
      collapseText: "",
    );
  }
}
