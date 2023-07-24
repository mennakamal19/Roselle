import 'package:flutter/material.dart';
import 'package:roselle_application/shared/components/components.dart';
import 'package:roselle_application/shared/styles/size.dart';

class SignUp extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var reenterPasswordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight*0.04),
              Text('Register Account',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.5
                  )),
              const Text('Complete your details or continue \n with social media',
                textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight*0.08),
              Form(
                key: signUpFormKey,
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
                    defaultFormField(
                        hint: 'Enter your password',
                        label: 'Password',
                        isPassword: true,
                        suffix:Icons.lock_outline_rounded,
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate:(String value){
                          if(value.length <6){
                            return 'please enter your Password more than 6 character';
                          }
                        }
                    ),
                    defaultFormField(
                        hint: 'Re-enter your password',
                        label: 'Confirm Password',
                        isPassword: true,
                        suffix:Icons.lock_outline_rounded,
                        controller: reenterPasswordController,
                        type: TextInputType.visiblePassword,
                        validate:(String value){
                          if(passwordController.text != value){
                            return 'please enter matched password';
                          }
                        }
                    ),
                    defaultButton('Sign in', (){
                      if(signUpFormKey.currentState!.validate()){

                      }
                    }),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight*0.08),
              Row(
                children: [
                  socialCard(Icons.facebook),
                  socialCard(Icons.facebook),
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              Text('By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,)
            ],
          ),
        ),
      ),
    );
  }
}
