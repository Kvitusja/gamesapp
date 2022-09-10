import 'package:flutter/material.dart';
import 'package:gamesapp/widgets/main_screen_widget/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn'),
      ),
      body: ListView(children: const [_HeaderWidget()]),
    );
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UserLoginPageText(text: 'Log In'),
        SizedBox(height: 10.0),
        UserLoginPageText(text: 'You can use social accounts to log in'),
        SizedBox(height: 5.0),
        LoginElevatedButton(
          color: Colors.blueAccent,
          text: 'Continue with Facebook',
          icon: Icons.facebook,
        ),
        SizedBox(
          height: 10.0,
        ),
        LoginElevatedButton(
            text: 'Continue with Twitter',
            color: Color.fromRGBO(51, 164, 236, 1),
            icon: Icons.speaker_notes_outlined),
        SizedBox(
          height: 10.0,
        ),
        LoginElevatedButton(
            text: 'Continue with Steam',
            color: Color.fromRGBO(60, 113, 147, 1),
            icon: Icons.engineering_sharp),
        SizedBox(
          height: 30.0,
        ),
        FormWidget(),
        SizedBox(
          height: 30.0,
        ),
        UserLoginPageText(
            myFontSize: 14.0,
            myTextDecoration: TextDecoration.underline,
            text: 'Don\'t have an account? Sign up'),
        SizedBox(
          height: 1.0,
        ),
        UserLoginPageText(
            myFontSize: 14.0,
            myTextDecoration: TextDecoration.underline,
            text: 'Forgot your password?'),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class UserLoginPageText extends StatelessWidget {
  final String text;
  final double myFontSize;
  final TextDecoration myTextDecoration;
  const UserLoginPageText({
    Key? key,
    required this.text,
    this.myTextDecoration = TextDecoration.none,
    this.myFontSize = 22.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Text(
          style: TextStyle(
              fontSize: myFontSize,
              decoration: myTextDecoration,
              color: Colors.white,
              fontWeight: FontWeight.w400),
          text),
    );
  }
}

class LoginElevatedButton extends StatefulWidget {
  final String text;
  final Color color;
  final IconData icon;
  const LoginElevatedButton(
      {Key? key, required this.text, required this.color, required this.icon})
      : super(key: key);

  @override
  State<LoginElevatedButton> createState() => _LoginElevatedButtonState();
}

class _LoginElevatedButtonState extends State<LoginElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            maximumSize: MaterialStateProperty.all(const Size(366, 40)),
            backgroundColor: MaterialStateProperty.all(widget.color),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10.0))),
        onPressed: buttonsStateChanged,
        child: Row(
          children: [
            Icon(widget.icon),
            const SizedBox(width: 75.0),
            Text(style: const TextStyle(fontSize: 17.0), widget.text),
          ],
        ));
  }
}

void buttonsStateChanged() {
  print('Button is pushed');
}



class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final loginTextController = TextEditingController(text: 'admin');
  final passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;
  void myAuthentification() {
    final myLogin = loginTextController.text;
    final myPass = passwordTextController.text;

    if (myLogin == 'admin' && myPass == 'admin') {
      Navigator.of(context).pushNamed('/mainscreen');
    } else {
      errorText = 'Wrong email or password';
    }
    setState(() {});
  }


  //void _registration (){}
  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
              errorText),
          SizedBox(height: 20.0),
        ],
        Container(
          margin: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 2.0, bottom: 4.0),
          child: TextField(
            textInputAction: TextInputAction.next,
            controller: loginTextController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 17.0, color: Colors.white),
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black26,
                contentPadding: EdgeInsets.fromLTRB(6.0, 3.0, 4.0, 3.0),
                border: OutlineInputBorder(),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 2.0, bottom: 4.0),
            child: TextField(
              controller: passwordTextController,
              obscureText: true,
              keyboardAppearance: Brightness.light,
              style: const TextStyle(fontSize: 17.0, color: Colors.white),
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black26,
                  contentPadding: EdgeInsets.fromLTRB(6.0, 3.0, 4.0, 3.0),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey)),
            )),
        const SizedBox(height: 30.0),
        ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
              overlayColor: MaterialStateProperty.all(Colors.grey),
              minimumSize: MaterialStateProperty.all(const Size(366, 48)),
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: myAuthentification,
          child: Text(style: TextStyle(color: Colors.black), 'Log In'),
        ),
      ],
    );
  }
}
