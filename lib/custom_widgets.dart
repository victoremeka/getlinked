import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "dart:async";
import "dart:math" show pow, sqrt;
import 'package:http/http.dart' as http;

class Button extends StatefulWidget {
  final String text;
  final Function() action;
  const Button({super.key, required this.text, required this.action});


  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  List<Color> gradientColour = const [Color(0xFF903AFF), Color(0xFFFE34B9),];

  @override
  Widget build(BuildContext context) {
    
  return MouseRegion(
    onEnter: (event) => setState(() => gradientColour = const [Color(0xFF111111),Color(0xFF111111)]),
    onExit: (event) => setState(() => gradientColour = const [Color(0xFF903AFF),Color(0xFFFE34B9)]),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: widget.action,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColour),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(child: Text(widget.text)),
      ),
    ),
  );
  }
}

class TextDropDown extends StatefulWidget {
  final String title;
  final String body;
  final double width;
  const TextDropDown({super.key, required this.title, required this.body, required this.width});

  @override
  State<TextDropDown> createState() => _TextDropDownState();
}

class _TextDropDownState extends State<TextDropDown> {
  double _height = 0;

  @override
  build(BuildContext context){
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: (){
                    setState(() {
                      _height == 0 ? _height = 24 : _height = 0;
                    });
                  }, 
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xFFD434FE),
                  ),
                ),
              )
            ],
          ),
          AnimatedContainer(
            height: _height,
            duration: const Duration(milliseconds: 400),
            child: Text(
              widget.body,
              style: const TextStyle(
                color: Colors.white60
              ),
            ),
          ),
          const Divider(
            thickness: 1.25,
            color: Color(0xFFD434FE),
          )
        ],
      ),
    );
  }
}

class TimeLineView extends StatefulWidget {
  const TimeLineView({super.key});

  @override
  State<TimeLineView> createState() => _TimeLineViewState();
}

class _TimeLineViewState extends State<TimeLineView> {
  List<List<String>> timelines = [
    ["Hackathon Announcement\n", "The getlinked tech hackathon 1.0 is formally announced to the general public and teams begin to get ready to register"]
  ];
  List<String> timelineIds = ["0"];
  List<List<String>> toAdd = [
    ["Teams Registration begins\n", "Interested teams can now show their interest in the getlinked tech hackathon 1.0 2023 by proceeding to register"],
    ["Teams Registration ends\n", "Interested Participants are no longer Allowed to register"],
    ["Announcement of the accepted teams and ideas\n", "All teams whom idea has been accepted into getlinked tech hackathon 1.0 2023 are formally announced"],
    ["Getlinked Hackathon 1.0 Offically Begins\n","Accepted teams can now proceed to build their ground breaking skill driven solutions"],
    ["Demo Day\n","Teams get the opportunity to pitch their projects to judges. The winner of the hackathon will also be announced on this day"],
  ];
  int idCount = 1;
  void addTimelines(){
    if(toAdd.isNotEmpty){
      timelines.add(toAdd[0]);
      timelineIds.add(idCount.toString());
      idCount ++;
      toAdd.removeAt(0);
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        for(int i = 0; i < timelines.length; i++)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              timelineWidget(i),
              if(timelines[i]  != timelines.last)Container(
                width: 2,
                height: 50,
                color: const Color(0xFFD434FE),
              ),
            ],
          ),
          if(toAdd.isNotEmpty) 
            GestureDetector(
              onTap: addTimelines,
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  CupertinoIcons.chevron_down,
                  size: 24,
                  color: Color(0xFFD434FE),
                )
              ),
            ),
      ] 
    );
  }


  Widget timelineWidget(int i){
    if(i%2 != 0){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text(
                "November 18, 2023"
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFD434FE),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                timelineIds[i],
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: timelines[i][0],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD434FE),
                  ),
                  children: [
                    TextSpan(
                      text: timelines[i][1],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    )
                  ]
                )
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: timelines[i][0],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD434FE),
                  ),
                  children: [
                    TextSpan(
                      text: timelines[i][1],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    )
                  ]
                )
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFD434FE),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                timelineIds[i],
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text(
                "November 18, 2023"
              ),
            ),
          )
        ],
      );
    }
  }
}

class AnimatedSphere extends StatefulWidget {
  final Widget child;
  const AnimatedSphere({super.key, required this.child});

  @override
  State<AnimatedSphere> createState() => _AnimatedSphereState();
}
class _AnimatedSphereState extends State<AnimatedSphere> {
  late bool startAxisVerical;
  double xPos = -1;
  double yPos = 0;
  double xFinal = 1;
  double yFinal = 0;
  final int _speed = 500;

  @override
  void initState(){
    super.initState();
    Timer.periodic(Duration(milliseconds: _speed), (_) => setState(() => calculatePos())); //TODO: Make a loop for the animation
    //Return a range of values from -1 to 1 and assign them to xPos initially
  }

  void calculatePos(){
    // We're moving in 10 stepped moves
    double proximity = sqrt(pow((xFinal - xPos),2) + pow((xFinal - xPos),2));
    if(proximity < 0.01) {
      xFinal = yFinal *= -1;
    }
    xPos += ((xFinal - xPos) / 10);
    yPos += ((yFinal - yPos) / 10);
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: Duration(milliseconds: _speed),
      alignment: Alignment(xPos,yPos),
      child: widget.child,
    );
  }
}

class ContactsPage extends StatefulWidget{

  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;

  @override void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
  }

  @override
  build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              const Center(
                child: Image(image: AssetImage("assets/contactPage.png")),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 617,
                    height: 600,
                    margin: const EdgeInsets.only(right: 40.0, top: 80),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.3),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Questions or need assistance?\nLet us know about it",
                          style: TextStyle(

                          ),
                        ),
                        TextField(
                          controller: _controller1,
                        ),
                        TextField(
                          controller: _controller2,
                        ),
                        TextField(
                          controller: _controller3,
                        ),
                        Button(text: "Submit", action: () async{
                          final response = await http.post(
                            Uri.parse("https://backend.getlinked.ai/hackathon/contact-form"),
                            headers: {
                              "Content-Type" : "application/json",
                            },
                            body: jsonEncode({
                              "email" : _controller2.text,
                              "phone_number" : "0903322445533",
                              "first_name" : _controller1.text,
                              "message" : _controller3.text,
                            })
                          );
                        })
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      )
    );
  }
}