import 'package:flutter/material.dart';
import 'package:flutter_project/util/const_value.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {

    //Variables
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(title: Text("Login"),),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: screenWidth - screenWidth * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.login, size: 80, color: Colors.grey,),
                  SizedBox(height: defaultSpace,),
                  Form(
                    key: _formKey,
                    autovalidateMode: _autoValidate,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.email_outlined),
                            ),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty ) return "Please enter email.";
                            return null;
                          },
                        ),
                        Container(height: defaultSpace,),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.lock),
                            ),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty ) return "Please enter password.";
                            return null;
                          },
                        ),
                        Container(height: defaultSpace,),
                        ElevatedButton(
                          child: Text("Login"),
                          onPressed: () async {
                            //Hide keyboard
                            FocusManager.instance.primaryFocus?.unfocus();

                            //Chcek form
                            if(!_formKey.currentState!.validate()){
                              setState(() { _autoValidate = AutovalidateMode.onUserInteraction;});
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
                          },
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, "ForgetPasswordPage");
                                },
                                child: const Text("忘記密碼?"),
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        color: Colors.blue
                                    )
                                ),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, "RegisterPage");
                                },
                                child: const Text("前往註冊"),
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        color: Colors.blue
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(height: defaultSpace,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: Divider( color: Colors.grey, indent: 10, endIndent: 10, thickness: 0.5,),),
                              Text("or",style: TextStyle(color: Colors.grey),),
                              Expanded(child: Divider(  color: Colors.grey, indent: 10, endIndent: 10, thickness: 0.5,),),
                            ],
                          ),
                        ),
                        Container(height: defaultSpace*2,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/facebook.png"),
                              Image.asset("assets/google.png"),
                              Image.asset("assets/line.png")
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
