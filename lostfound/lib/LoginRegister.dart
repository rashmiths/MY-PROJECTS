import 'package:flutter/material.dart';
import 'package:l_a_f/DialogBox.dart';
import 'Authentication.dart';
import 'DialogBox.dart';


class LoginRegister extends StatefulWidget
{
  LoginRegister
      ({
         this.auth,
         this.onSignedIn,

      });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  State<StatefulWidget> createState()
  {
    return _LoginRegister();
  }

}
enum FormType
{
  login,
  register,
}
final formkey = new GlobalKey<FormState>();
FormType _formType = FormType.login;
String _email = "";
String _password = "";
class _LoginRegister extends State<LoginRegister> {

  DialogBox dialogBox = DialogBox();


  bool validateAndSave() {
    final form =formkey.currentState;

    if(form.validate())
      {
        form.save();
        return true;
      }
    else
      {
        return false;
      }


  }

  void validateAndSubmit() async
  {
    if(validateAndSave())
      {
        try
        {
          if(_formType==FormType.login)
            {
              String userId= await widget.auth.SignIn(_email, _password);
              //dialogBox.information(context, "Congratulations","you are logged in successfully","  ***  ");

              print("login userId=" + userId);
            }
          else
            {
              String userId = await widget.auth.SignUp(_email, _password);
              //dialogBox.information(context, "Congratulations","your Account has been created successfully","  ***  ");
              print("Register userId " + userId);

            }
          widget.onSignedIn();

        }
        catch(e)
    {
      dialogBox.information(context, "Error=",e.toString()," *** ");
      print("Error=" + e.toString());
    }
      }
  }

  void moveToRegister() {
    formkey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

    void moveToLogin() {
      formkey.currentState.reset();

      setState(() {
        _formType = FormType.login;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("lostAndFound"),
          ),
          body:
          new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Image(image: new AssetImage("images/1.jpeg"),
                  fit: BoxFit.cover,
                  color: Colors.black54,
                  colorBlendMode: BlendMode.darken,
                ),

                new Container(
                  margin: EdgeInsets.all(15.0),
                  child: new Form(

                      key: formkey,
                      child: new Column(

                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: createInputs() + createButtons(),


                      )
                  ),
                ),

              ]));
    }

    List<Widget> createInputs() {
      return [
        SizedBox(height: 5.0,),
        logo(),
        SizedBox(height: 10.0,),
        new TextFormField(
          style: new TextStyle(color: Colors.white),
          decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(
            color: Colors.white,
          ),),

          validator: (value) {
            return value.isEmpty ? 'Email is required.' : null;
          },
          onSaved: (value) {
            return _email = value;
          },
        ),
        SizedBox(height: 5.0,),
        new TextFormField(
          style: new TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelText: 'Password', labelStyle: TextStyle(
            color: Colors.white,
          )
          ),
          obscureText: true,
          validator: (value) {
            return value.isEmpty ? 'password is required.' : null;
          },
          onSaved: (value) {
            return _password= value;
          },
        ),

      ];
    }


  Widget logo() {
    return Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50,
        child: Image.asset('images/nitk1.jpeg'),
      ),
    );
  }

  List<Widget> createButtons() {
    if (_formType == FormType.login) {
      return [
        SizedBox(height: 10,),

        RaisedButton(
          color: Colors.pink,
          child: Text("Login", style: new TextStyle(fontSize: 20.0,
              color: Colors.white,
              ),),
          onPressed: validateAndSubmit,


        ),
        FlatButton(
          child: Text("Not have an Account?Create Account?",
            style: new TextStyle(fontSize: 20.0, color: Colors.white),),
          textColor: Colors.white,

          onPressed: moveToRegister,

        ),
      ];
    }
    else {
      return [

        RaisedButton(
          color: Colors.black,
          child: Text("Create Account", style: new TextStyle(fontSize: 20.0,
              color: Colors.lightBlue,
              backgroundColor: Colors.black),),
          onPressed: validateAndSubmit,


        ),
        FlatButton(
          child: Text("Already have an account",
            style: new TextStyle(fontSize: 20.0, color: Colors.white),),
          textColor: Colors.white,

          onPressed: moveToLogin,

        ),
      ];
    }
  }
  }
