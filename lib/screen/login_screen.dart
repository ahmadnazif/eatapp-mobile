import 'package:eatapp_mobile/core/rest_api_client.dart';
import 'package:eatapp_mobile/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// Define a custom Form widget.
class LoginScreen extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<LoginScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  final api = new RestApiClient("http://localhost:6001");

  @override
  void dispose() {
    usernameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void login() async {
    var login =
        new UserLogin(usernameTextController.text, passwordTextController.text);
    var resp = await api.login(login);
    var alert = Alert(context: context, title: "Login result", desc: resp.toJsonString());
    alert.show();
  }

  Widget body() {
    return Column(children: <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: "Your username"),
        controller: usernameTextController,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: "Your password"),
        controller: passwordTextController,
      ),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text("Sign In"),
            color: Color.fromRGBO(192, 100, 57, 0.5),
            onPressed: login,
          )
        ],
      )
    ]);
  }

  Widget oldBody() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          decoration: InputDecoration(labelText: 'Username'),
          controller: usernameTextController,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: body(),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(""),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
