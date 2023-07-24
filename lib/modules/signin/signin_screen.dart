import 'package:flutter/material.dart';
import 'package:roselle_application/modules/signup/signup_screen.dart';
import 'package:roselle_application/shared/components/components.dart';
import 'package:roselle_application/shared/styles/size.dart';

class Login extends StatelessWidget {
  var signInFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text('Welcome Back',
                style: TextStyle(color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              const Text('Sign in with your email and password \nor continue with social media',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Form(
                key: signInFormKey,
                child:Column(
                  children: [
                    defaultFormField(
                      hint: 'Enter your email',
                      label: 'Email',
                      suffix:Icons.mail_outline_rounded,
                      controller:emailController ,
                      type: TextInputType.emailAddress,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'please enter your email address';
                        }
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    defaultFormField(
                        hint: 'Enter your password',
                        label: 'Password',
                        isPassword: true,
                        suffix:Icons.lock_outline_rounded,
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate:(String value){
                          if(value.isEmpty){
                            return 'please enter your Password';}
                        }
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      children: [
                        Checkbox(
                            value: false,
                            // activeColor: ,
                            onChanged: (value){}
                        ),
                        const Text('Remember me'),
                        const Spacer(),
                        const Text('Forget Password',
                            style: TextStyle( decoration: TextDecoration.underline
                            ))
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    defaultButton('Sign In', (){
                      if(signInFormKey.currentState!.validate()){
                        //signInFormKey.currentState!.save();
                        // if all are valid then go to success screen
                      }
                    }),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialCard(Icons.facebook),
                  socialCard(Icons.facebook),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  ),
                  GestureDetector(
                    onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (ctx)=>(SignUp())))},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


