import 'package:flutter/material.dart';

class ElavatedButtonWidget<SignInFormEvent> extends StatelessWidget {
  ///https://stackoverflow.com/questions/67656140/using-type-function-and-pass-it-into-elevatedbutton-onpressed-flutter
  /// onPressed is a type of VoidCallback
  final Function()? onCustomButtonPressed;
  final String buttonLabel;

  const ElavatedButtonWidget({
    Key? key,
    required this.buttonLabel,
    required this.onCustomButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /// if not mentioned aligment button will move to the edge
      /// of the list view
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      // color: Colors.green,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          /// Button height and width
          minimumSize: const Size(
            300,
            50,
          ),
          textStyle: const TextStyle(fontSize: 20),
          primary: Colors.blue[200],

          /// Backgroud
          onPrimary: Colors.black,

          /// Font color
          /// Button circular boder radiaus a
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(buttonLabel.toString()),
        onPressed: () {
          onCustomButtonPressed;
        },
      ),
    );
  }
}
