import 'package:flutter/material.dart';
import 'package:flutter_project/util/const_value.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

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
          appBar: AppBar(title: Text("Forget password"),),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: screenWidth - screenWidth * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.help_outline, size: 80, color: Colors.grey,),
                    SizedBox(height: defaultSpace,),
                    Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate,
                      child: Column(
                        children: <Widget>[

                          TextFormField(
                            textInputAction: TextInputAction.done,
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
                          ElevatedButton(
                            child: Text("Submit"),
                            onPressed: () async {
                              //Hide keyboard
                              FocusManager.instance.primaryFocus?.unfocus();
                              //Chcek form
                              if(!_formKey.currentState!.validate()){
                                setState(() { _autoValidate = AutovalidateMode.onUserInteraction;});
                                return;
                              }
                            },
                          ),
                          Container(height: defaultSpace*2,),
                          Container(
                            child: Center(
                              child: TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text("返回登入"),
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        color: Colors.blue
                                    )
                                ),
                              ),
                            )
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
