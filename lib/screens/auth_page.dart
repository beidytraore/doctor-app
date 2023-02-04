import 'package:doc/componemts/login_form.dart';
import 'package:doc/componemts/social_button.dart';
import 'package:doc/utils/config.dart';
import 'package:doc/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppText.enText['welcome_text']!,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
                Text(
                AppText.enText['signIn_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              //login componemt here
              LoginForm(),
              Config.spaceSmall,
              Center(
                child: TextButton(
                  onPressed: () {}, 
                  child: Text(
                    AppText.enText['forgot_password']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  )),
              ),
              const Spacer(),
              Center(
                child: Text(
                  AppText.enText['social-login']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SocialButton(social:'google'),
                  SocialButton(social:'google'),

                ],
              ),                          
                Config.spaceSmall,
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                AppText.enText['signup_text']!,
                 style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                 )
                  ),
               Text(
                'Creer un compte',
                 style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                 )
                  )
                ],
              ),          
            ],
          )),
      ),
    );
  }
}