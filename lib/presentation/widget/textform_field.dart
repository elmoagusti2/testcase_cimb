import 'package:cimb_testcase/common/regex.dart';
import 'package:flutter/material.dart';

class TextFormCustom {
  static email({required txtEmail}) {
    return TextFormField(
      controller: txtEmail,
      validator: (text) {
        if (!RegularExpressions.email.hasMatch(text.toString())) {
          return "Input Email Format";
        }
        return null;
      },
      obscureText: false,
      enableSuggestions: false,
      enabled: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: .5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: .5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Email',
        focusColor: Colors.white,
        errorStyle: const TextStyle(
          color: Colors.white,
          height: 0,
        ),
      ),
    );
  }

  static password(
      {required txtPassword, required visiblePassword, required showPassword}) {
    return TextFormField(
      controller: txtPassword,
      validator: (text) {
        if (!RegularExpressions.password.hasMatch(text.toString())) {
          return "Minimum 8 letters";
        }
        return null;
      },
      obscureText: visiblePassword ? true : false,
      enableSuggestions: false,
      enabled: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: .5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: .5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
        focusColor: Colors.white,
        errorStyle: const TextStyle(
          color: Colors.white,
          height: 0,
        ),
        suffixIcon: GestureDetector(
          onTap: showPassword,
          child: Icon(visiblePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey, size: 19),
        ),
      ),
    );
  }

  static general({required txtTitle, required title}) {
    return TextFormField(
      controller: txtTitle,
      obscureText: false,
      enableSuggestions: false,
      enabled: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: .5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: .5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: '$title',
        focusColor: Colors.white,
        errorStyle: const TextStyle(
          color: Colors.white,
          height: 0,
        ),
      ),
    );
  }
}
