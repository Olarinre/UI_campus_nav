import "package:flutter/material.dart";

// i'll have to rewrite this using the example in the vidoe.
//username field

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'example@email.com',
        //label:
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 2, 21, 124),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white10,
          ),
        ),
        fillColor: Colors.grey,
        filled: true,
      ),
    );
  }
}

//Password Field
class PasswordField extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  const PasswordField({
    super.key,
    required this.controller,
    required this.hinttext,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: const Color.fromARGB(255, 2, 21, 124),
          ),
          onPressed: () {
            setState(
              () {
                _obscureText = !_obscureText;
              },
            );
          },
        ),
        fillColor: Colors.grey,
        filled: true,
      ),
    );
  }
}
