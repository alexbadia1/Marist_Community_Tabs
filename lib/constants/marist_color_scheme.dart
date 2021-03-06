import 'package:flutter/material.dart';
import 'package:loading_fixed/loading_fixed.dart';

/// Margins
///
/// Horizontal Margins
SizedBox cLeftMarginSmall(context) {
  return SizedBox(width: MediaQuery.of(context).size.width * .05);
}

SizedBox cLeftMarginMedium(context) {
  return SizedBox(width: MediaQuery.of(context).size.width * .1);
}

SizedBox cRightMarginSmall(context) {
  return SizedBox(width: MediaQuery.of(context).size.width * .05);
}

/// Vertical Margins
SizedBox cVerticalMarginSmall(context) {
  return SizedBox(height: MediaQuery.of(context).size.height * .05);
}

//Dark Mode
const Color cBackground = Color.fromRGBO(0, 0, 0, .935);
const Color cDialogueBackground = Color.fromRGBO(10, 10, 10, .935);
const Color cCard = Color.fromRGBO(35, 35, 35, 1);
const Color cWhite70 = Color.fromRGBO(255, 255, 255, .7);
const Color cWhite65 = Color.fromRGBO(255, 255, 255, .625);
const Color cWhite25 = Color.fromRGBO(255, 255, 255, .25);
const Color cWhite12 = Colors.white12;
const Color cWhite100 = Color.fromRGBO(255, 255, 255, 1);
const Color cBlue = Colors.blueAccent;

//Washed
const Color cWashedRed = Color.fromRGBO(255, 77, 77, .8);
const Color cWashedGreen = Color.fromRGBO(121, 255, 77, 1.0);
//Full Red
const Color cFullRed = Color.fromRGBO(230, 0, 0, .8);
const Color cFullGreen = Color.fromRGBO(57, 230, 0, 1.0);

const Color cWashedRedFaded = Color.fromRGBO(255, 77, 77, .725);
//Full Red
const Color cFullRedFaded = Color.fromRGBO(230, 0, 0, .725);

//iLearn Green
const Color cIlearnGreen = Color.fromRGBO(0, 110, 122, 1.0);

//Modern Gray
const Color kHavenLightGray = Color.fromRGBO(50, 50, 50, 1.0);
const Color kActiveHavenLightGray = Color.fromRGBO(77, 77, 77, 1.0);

//Components
const Color cBackgroundColor = Color.fromRGBO(255, 255, 255, 1.0);
const cBorder = BorderSide(width: .275, color: cWhite70);

//Fully solid gradients
LinearGradient cGreedGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    cWashedGreen,
    cFullGreen,
  ],
);

//Gradients
LinearGradient cMaristGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    cWashedRed,
    cFullRed,
  ],
);

LinearGradient cMaristGradientWashed = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    cWashedRedFaded,
    cFullRedFaded,
  ],
);

//Gradients
LinearGradient cShadowGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: <Color>[
    Color.fromRGBO(31, 31, 31, .35),
    Color.fromRGBO(61, 61, 61, .25),
  ],
);

class FullScreenGradient extends StatelessWidget {
  final gradient;
  final height;

  FullScreenGradient({@required this.gradient, @required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            cWashedRed,
            cFullRed,
          ],
        ),
      ),
    );
  }
}

//Form Text Field Decoration
const InputDecoration customTextField = InputDecoration(
  errorStyle: TextStyle(color: Colors.black),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(255, 255, 255, .5),
    ),
  ),
);

const InputDecoration cAddEventTextFormFieldDecoration = InputDecoration(
  errorStyle: TextStyle(color: Colors.black),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, .5)),
  ),
  hintStyle: TextStyle(color: cWhite25),
  border: InputBorder.none,
);

class BorderTop extends StatelessWidget {
  final Widget child;

  const BorderTop({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.25,
            color: Color.fromRGBO(61, 61, 61, 1.0),
          ),
        ),
      ),
      child: child,
    );
  }// build
}// BorderTop

class BorderBottom extends StatelessWidget {
  final Widget child;

  const BorderBottom({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.25,
            color: Color.fromRGBO(61, 61, 61, 1.0),
          ),
        ),
      ),
      child: child,
    );
  }// build
}// BorderTop

class BorderTopBottom extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const BorderTopBottom({Key key, @required this.child, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.25,
            color: Color.fromRGBO(61, 61, 61, 1.0),
          ),
          bottom: BorderSide(
            width: 1.25,
            color: Color.fromRGBO(61, 61, 61, 1.0),
          ),
        ),
      ),
      child: child,
    );
  }// build
}// BorderTop


const Decoration cAddEventBottomBorder =
    BoxDecoration(border: Border(bottom: cBorder));

//Loading Widget
class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;
  LoadingWidget({this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .65,
      child: Center(
        child: FixedLoadingWidget(
          indicator: BallSpinFadeLoaderIndicator(),
          size: size ?? 55.0,
          color: color ?? Color.fromRGBO(255, 255, 255, .50),
        ),
      ),
    );
  }
}

SnackBar formErrorSnackBar(BuildContext context, String message) {
  return SnackBar(
    content: Container(
      height: MediaQuery.of(context).size.height * .07,
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Text(
        message,
        style: TextStyle(color: Colors.redAccent),
      ),
    ),
  );
}

