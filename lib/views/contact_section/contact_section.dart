import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio_contact/widgets/section_title.dart';
import 'package:portfolio_contact/constants.dart';

import 'components/socal_card.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For more information",
            color: kPrimaryColor,
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
      constraints: const BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: const BoxDecoration(
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
                color: kLinkedInColor,
                iconSrc: "assets/images/linkedin.png",
                iconeScale: kIconScale,
                name: 'LinkedIn',
                press: openLinkedIn,
              ),
              SocalCard(
                color: kWhatsAppColor,
                iconSrc: "assets/images/whatsapp.png",
                name: 'WhatsApp',
                press: openWhatsApp,
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({
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

  /// Form submission method - configure with your own API endpoint
  /// This is a placeholder implementation for demonstration purposes
  Future<void> submitForm({required String name, required String email, required String message}) async {
    print('name: $name');
    print('email: $email');
    print('message: $message');

    // TODO: Implement actual form submission with your secure API configuration
    // Example:
    // try {
    //   final url = Uri.parse(yourFormUrl);
    //   final response = await http.post(url, body: {
    //     "name": name,
    //     "email": email,
    //     "message": message,
    //     "token": yourSecureToken,
    //   });
    //   if (response.statusCode == 200) {
    //     return;
    //   } else {
    //     throw Exception('Form submission failed');
    //   }
    // } catch (e) {
    //   print('Error: ${e.toString()}');
    //   rethrow;
    // }

    // Simulate successful submission for demo purposes
    await Future.delayed(const Duration(seconds: 1));
    print("Form submission simulated - configure with your actual API");
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
            width: kFormFieldWidth,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please insert your name";
                }
                name = value.trim();
                return null;
              },
            ),
          ),
          SizedBox(
            width: kFormFieldWidth,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please insert your email";
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
                  return 'Please insert a valid email';
                }
                email = value.trim();
                return null;
              },
            ),
          ),
          SizedBox(
            child: TextFormField(
              minLines: 3,
              maxLines: 7,
              decoration: const InputDecoration(
                labelText: "Message",
                hintText: "Write Your Message",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please insert your message";
                }
                message = value.trim();
                return null;
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
                    backgroundColor: !isSent ? const Color.fromARGB(255, 223, 239, 247) : const Color.fromARGB(255, 156, 242, 200),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kButtonHorizontalPadding,
                      vertical: kButtonVerticalPadding,
                    ),
                    child: Row(
                      children: [
                        if (!isSent)
                          Image.asset(
                            "assets/images/contact_icon.png",
                            height: !isLoading ? kContactIconHeight : kContactIconHeightLoading,
                            opacity: const AlwaysStoppedAnimation(0.8),
                          ),
                        if (isSent)
                          const Icon(
                            Icons.done_outline,
                            color: Colors.green,
                          ),
                        const SizedBox(width: kDefaultPadding),
                        Text(
                          !isSent ? "Send Message" : "Message Sent",
                          style: kButtonTextStyle,
                        ),
                        const SizedBox(width: kDefaultPadding),
                        if (isLoading)
                          const CircularProgressIndicator(
                            color: Colors.lightBlue,
                          )
                      ],
                    ),
                  ),
                  onPressed: () async {
                    if (isSent) {
                      return;
                    }
                    print("Send button clicked");
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() {
                        isLoading = true;
                        isError = false;
                      });
                      try {
                        await submitForm(
                          name: name,
                          email: email,
                          message: message,
                        );
                        setState(() {
                          isLoading = false;
                          isSent = true;
                        });
                      } catch (e) {
                        print('Error submitting form: ${e.toString()}');
                        setState(() {
                          isLoading = false;
                          isError = true;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to send message. Please try again.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: kBottomSpacing),
        ],
      ),
    );
  }
}
