// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'package:portfolio_contact/components/section_title.dart';
import 'package:portfolio_contact/constants.dart';

import 'components/socal_card.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For more information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);

  Future<void> openLinkedIn() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/anis-zouaghi/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> openWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/213559691092');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SocalCard(
                color: Color(0xFFD9FFFC),
                iconSrc: "assets/images/linkedin.png",
                iconeScale: 0.8,
                name: 'LinkedIn',
                press: openLinkedIn,
              ),
              SocalCard(
                color: Color(0xFFE4FFC7),
                iconSrc: "assets/images/whatsapp.png",
                name: 'WhatsApp',
                press: openWhatsApp,
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String name = '';

  String email = '';

  String message = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool isSent = false;

  bool isError = false;

  Future<void> submitForm({required String name, required String email, required String message}) async {
    print('name: $name ');
    print('email: $email ');
    print('message: $message ');
    final url = Uri.parse("https://www.zouaghi.dev/wp-admin/admin-ajax.php");

    final response = await http.post(
      url,
      body: {
        "wpforms[fields][4]": name.toString(),
        "wpforms[fields][2]": email.toString(),
        "wpforms[fields][1]": '',
        "wpforms[fields][5]": '',
        "wpforms[fields][3]": message.toString(),
        "wpforms[id]": "476",
        "page_title": "contact-form-api",
        "page_url": "https://www.zouaghi.dev/contact-form-api/",
        "page_id": "479",
        "wpforms[post_id]": "479",
        "wpforms[submit]": " wpforms-submit",
        "wpforms[token]": "e0043e62e15e4224a04b36c4bb5fea5d",
        "action": "wpforms_submit",
        "start_timestamp": "1739380611",
        "end_timestamp": "1739380646"
      },
    );

    if (response.statusCode == 200) {
      print("Form submitted successfully!");
    } else {
      print("Failed to submit form. Status: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
              validator: (value) {
                if (value == null || (value.trim().isEmpty)) {
                  return "Please insert your name";
                }
                name = value;
              },
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
              validator: (value) {
                if (value == null) {
                  return "Please insert your email";
                }
                if (!(value.contains('@') && value.contains('.'))) {
                  return 'Please insert a valid email';
                }
                email = value;
              },
            ),
          ),
          SizedBox(
            child: TextFormField(
              minLines: 3,
              maxLines: 7,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Message",
                hintText: "Write Your Message",
              ),
              validator: (value) {
                message = value ?? '';
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: !isSent ? const Color.fromARGB(255, 223, 239, 247) : const Color.fromARGB(255, 156, 242, 200)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: Row(
                        children: [
                          if (!isSent)
                            Image.asset(
                              "assets/images/contact_icon.png",
                              height: !isLoading ? 40 : 20,
                              opacity: AlwaysStoppedAnimation(0.8),
                            ),
                          if (isSent)
                            Icon(
                              Icons.done_outline,
                              color: Colors.green[400],
                            ),
                          SizedBox(width: kDefaultPadding),
                          Text(
                            !isSent ? "Send Message" : "Message Sent",
                            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                          SizedBox(width: kDefaultPadding),
                          if (isLoading)
                            CircularProgressIndicator(
                              color: Colors.lightBlue,
                            )
                        ],
                      ),
                    ),
                    onPressed: () async {
                      if (isSent) {
                        return;
                      }
                      print("clicked");
                      if (_formKey.currentState?.validate() ?? false) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await submitForm(
                            name: name,
                            email: email,
                            message: email,
                          );
                          setState(() {
                            isLoading = false;
                            isSent = true;
                          });
                        } catch (e, trace) {
                          print('Error: ${e.toString()} \n trace: ${trace.toString()}');
                          setState(() {
                            isLoading = false;
                          });
                          if (e.toString().contains('ClientException: Failed to fetch, uri=https://www.zouaghi.dev/wp-admin/admin-ajax.php')) {
                            setState(() {
                              isSent = true;
                            });
                          }
                        }
                      }
                    },
                  )),
            ],
          ),
          SizedBox(height: 400),
        ],
      ),
    );
  }
}
