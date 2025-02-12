import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_contact/components/default_button.dart';
import 'package:portfolio_contact/components/section_title.dart';
import 'package:portfolio_contact/constants.dart';

import 'components/socal_card.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
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

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
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
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Send Message",
                press: () {},
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
