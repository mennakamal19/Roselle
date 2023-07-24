import 'package:flutter/material.dart';
import 'package:roselle_application/shared/styles/size.dart';


/// for signIn and signUp Screens

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required String hint,
  required IconData suffix,
  bool isClickable = true,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted:(s)
        {onSubmit!();},
        onChanged:(s)
        {
          onChange!();
        } ,
        onTap: ()
        {
          onTap!();
        },
        validator:(s)
        {
          validate(s);
        },
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            suffixIcon: Icon(suffix),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(horizontal: 42,vertical: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.grey),
              gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: Colors.grey),
                gapPadding: 10
            )
        )
    );


Widget defaultButton(
    String text,
    Function press
    )=> SizedBox(
        width: double.infinity,
        height: getProportionateScreenWidth(56),
        child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                primary: Colors.white,
                backgroundColor: Colors.amber
            ),
            onPressed: (){ press; },
            child: Text(
              text,style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white),
            )),
);

Widget socialCard(
    IconData icon,
    ) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      padding: EdgeInsets.all(getProportionateScreenWidth(12)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle
      ),
      child: Icon(icon),
    );
