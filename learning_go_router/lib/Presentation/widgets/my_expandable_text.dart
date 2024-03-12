import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:email_validator/email_validator.dart';

class MyExpandableText extends StatelessWidget {
  const MyExpandableText({super.key, required this.text});
  final String text;

  Future<void> _launchUrl(String url, context) async {

    Uri uri = Uri.parse(url);

    if(EmailValidator.validate(url)) {
      uri = Uri.parse('mailto:${url}');
    } else if (uri.scheme == ''){
      uri = Uri.parse('https://${url}');     
      
    } else {
      try {
        int.parse(url);
        uri = Uri.parse("tel:$url");
      } catch(e) {

      }
    }

    if (!(await launchUrl(uri))) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Can't open url")));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      maxLines: 5,
      collapseOnTextTap: true,
      expandOnTextTap: true,
      expandText: "read more",
      onUrlTap: (url) {
        print("Url $url tapped");

        _launchUrl(url, context);
      },
      urlStyle: TextStyle(
        color: Colors.blue.shade600,
      ),
      linkStyle: TextStyle(
        color: Colors.grey.shade600,
      ),
      hashtagStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      onHashtagTap: (value) {
        print("Hashtag $value tapped");
      },
      mentionStyle: const TextStyle(color: Colors.blue),
      onMentionTap: (value) {
        print("Mention: $value tapped");
      },
      collapseText: "",
    );
  }
}
