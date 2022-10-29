import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required this.color,
      required this.text,
      required this.textColor,
      required this.x})
      : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final String text;
  final Color color, textColor;
  final Function x;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          x(context);
        }
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                  style: BorderStyle.solid,
                  color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w700, fontSize: 20),
          ))),
    );
  }
}

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.color,
      required this.text,
      required this.textColor,
      required this.x})
      : super(key: key);

  final String text;
  final Color color, textColor;
  final Function x;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        x();
      },
      child: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 20),
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                color: Colors.grey.shade200,
                blurRadius: 5,
                spreadRadius: 3)
          ], color: color, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: AutoSizeText(
            text,
            minFontSize: 15,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ))),
    );
  }
}

class TextButon extends StatelessWidget {
  const TextButon(
      {Key? key,
      required this.context,
      required this.route,
      required this.leading,
      required this.button})
      : super(key: key);

  final BuildContext context;
  final Widget route;
  final String leading, button;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        child: AutoSizeText(leading,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                overflow: TextOverflow.ellipsis)),
      ),
      const SizedBox(
        width: 5,
      ),
      InkWell(
        onTap: () {
          if (button.contains("pass") || button.contains("reate")) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => route));
          }
        },
        child: AutoSizeText(button,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16)),
      ),
    ]);
  }
}

class Button2 extends StatelessWidget {
  const Button2(
      {Key? key,
      required this.color,
      required this.text,
      required this.textColor,
      required this.x,
      required this.icon})
      : super(key: key);
  final IconData icon;
  final String text;
  final Color color, textColor;
  final Function x;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        x();
      },
      child: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.08),
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(
                  style: BorderStyle.solid,
                  width: 2,
                  color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                text,
                minFontSize: 15,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                width: 15,
              ),
              Icon(
                icon,
                color: textColor,
              ),
            ],
          ))),
    );
  }
}
