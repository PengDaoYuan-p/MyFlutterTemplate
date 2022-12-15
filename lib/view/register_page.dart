import 'package:flutter/material.dart';
import 'package:flutter_project/util/const_value.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  //temp
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {

    //Variables
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset : false,
          appBar: AppBar(title: Text("Register"),),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: screenWidth - screenWidth * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.create_outlined, size: 80, color: Colors.grey,),
                    SizedBox(height: defaultSpace,),
                    Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "Username",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(defaultPadding),
                                child: Icon(Icons.person_outline),
                              ),
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty ) return "Please enter username.";
                              return null;
                            },
                          ),
                          Container(height: defaultSpace,),
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
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Colors.blue,
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() { _isChecked = value!;});
                                  }
                                ),
                                Text("我已詳細閱讀並同意條款", style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                          ),
                          ElevatedButton(
                            child: Text("Register"),
                            onPressed: () async {
                              //Hide keyboard
                              FocusManager.instance.primaryFocus?.unfocus();

                              //Chcek form
                              if(!_formKey.currentState!.validate()){
                                setState(() { _autoValidate = AutovalidateMode.onUserInteraction;});
                                return;
                              }
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register Success")));
                            },
                          ),
                          Container(height: defaultSpace*2,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("已經有帳號了?" , style: TextStyle(color: Colors.grey),),
                                TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text("返回登入"),
                                  style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                          color: Colors.blue
                                      )
                                  ),
                                )
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
