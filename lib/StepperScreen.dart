import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class StepperScreen extends ScreenWidget {
  @override
  State createState() => _StateStepperScreen();

  @override
  String get title => 'Stepper';

}

class _StateStepperScreen extends State<StepperScreen> {


  List<Step> _steps;
  int _current;


  @override
  void initState() {
    _current = 0;
    _steps = <Step>[
      new Step(title: new Text('Step 1'), content: new Text('Content 1'), isActive: true),
      new Step(title: new Text('Step 2'), content: new Text('Content 2'), isActive: true),
      new Step(title: new Text('Step 3'), content: new Text('Content 3'), isActive: true),
    ];
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if(_current >= _steps.length) _current = _steps.length - 1;
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if(_current < 0) _current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: new Stepper(
            steps: _steps,
            type: StepperType.vertical,
            currentStep: _current,
            onStepCancel: _stepCancel,
            onStepContinue: _stepContinue,
            onStepTapped: _stepTap,
          ),
        ),
      ),
    );
  }
}
