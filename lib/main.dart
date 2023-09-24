import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/custom_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Getlinked',
      home: ContactsPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  DateTime time = DateTime.now();
  late int seconds;
  late int minutes;
  late int hours;

  @override
  void initState() {
    super.initState();
    seconds = time.second % 60;
    minutes = time.minute & 60;
    hours = time.hour;

    //TODO: Uncomment Below
    Timer.periodic(const Duration(seconds: 1), (_) => setState((){})); 
    
  }

  @override
  build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF150E28),
      body:  Stack(
        children: [
          const AnimatedSphere(
            child: Image(image: AssetImage("assets/Purple-Lens-Flare-PNG-2.png"),),
          ),
          SingleChildScrollView(
            child: DefaultTextStyle(
              style: GoogleFonts.josefinSans(
                //ADD CUSTOM FONT
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: header(false),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(right: 32.0),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Igniting a Revolution in HR Innovation",
                        style: TextStyle(
                          fontSize: 36,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        heroLeftHalf(false),
                        SizedBox(
                          width: 400,
                          child: heroRightHalf(false),
                        ),
                      ]
                    )
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  Container(
                    height: 617,
                    padding: const EdgeInsets.symmetric(vertical: 56.0, horizontal: 36.0,),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 400,
                          child: Image(
                            image: AssetImage("assets/The big idea.png"),
                            ),
                        ),
                        expos(false, text1: "Introduction to getlinked", text2: "techHackathon", 
                        bodyText: "Our tech hackathon is a melting pot of visionaries, and its purpose is as clear as day: to shape the future. Whether you're a coding genius, a design maverick, or a concept wizard, you'll have the chance to transform your ideas into reality. Solving real-world problems, pushing the boundaries of technology, and creating solutions that can change the world, that's what we're all about!"
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  Container(
                    height: 617,
                    padding: const EdgeInsets.symmetric(vertical: 56.0, horizontal: 36.0,),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        expos(false, text1: "Rules", text2: "And Guidelines", 
                        bodyText: "Our tech hackathon is a melting pot of visionaries, and its purpose is as clear as day: to shape the future. Whether you're a coding genius, a design maverick, or a concept wizard, you'll have the chance to transform your ideas into reality. Solving real-world problems, pushing the boundaries of technology, and creating solutions that can change the world, that's what we're all about!"
                        ),
                        const SizedBox(
                          width: 500,
                          child: Image(
                            image: AssetImage("assets/sittingWoman.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0,),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 500,
                          child: Image(
                            image: AssetImage("assets/peopleHoldingPieChart.png"),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(
                          width: 512,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Judging Criteria",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Key Attributes",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFD434FE),
                                )
                              ),
                              const SizedBox(height: 8.0,),
                              dualToneText(14, t1 : "Innovation and Creativity : ", t2 : "Evaluate the uniqueness and creativity of the solution. Consider whether it addresses a real-world problem in a novel way or introduces innovative features.\n", flipped: true),
                              dualToneText(14, t1 : "Functionality : ", t2 : "Assess how well the solution works. Does it perform its intended functions effectively and without major issues? Judges would consider the completeness and robustness of the solution.\n", flipped: true),
                              dualToneText(14, t1 : "Impact and Relevance : ", t2 : "Determine the potential impact of the solution in the real world. Does it address a significant problem, and is it relevant to the target audience? Judges would assess the potential social, economic, or environmental benefits.\n", flipped: true),
                              dualToneText(14, t1 : "Technical Complexity : ", t2 : "Evaluate the technical sophistication of the solution. Judges would consider the complexity of the code, the use of advanced technologies or algorithms, and the scalability of the solution.\n", flipped: true),
                              dualToneText(14, t1 : "Adherence to Hackathon Rules : ", t2 : "Judges will Ensure that the team adhered to the rules and guidelines of the hackathon, including deadlines, use of specific technologies or APIs, and any other competition-specific requirements.\n", flipped: true),
                              Button(text: "Read More", action: (){})
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                   SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            expos(false, text1: "Frequently Asked", text2: "Questions", bodyText: "We got answers to the questions that you might want to ask about getlinked Hackathon 1.0"),
                            const SizedBox(height: 4.0,),
                            const TextDropDown(title: "Can I work on a project I started before the hackathon?", body: "That is yet to be determined. We will announce the rules in the coming days.", width: 500),
                            const TextDropDown(title: "What happens if I need help during the hackathon?", body: "That is yet to be determined. We will announce the rules in the coming days.", width: 500),
                            const TextDropDown(title: "Can I join a team or do I have to come with one?", body: "That is yet to be determined. We will announce the rules in the coming days.", width: 500),
                            const TextDropDown(title: "What happens after the hackathon ends?", body: "That is yet to be determined. We will announce the rules in the coming days.", width: 500),
                           ],
                        ),
                        const SizedBox(
                          width: 500,
                          child: Image(
                            image: AssetImage(
                              "assets/FAQ image.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      children: const [
                        Text(
                          "The Timeline",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          )
                        ),
                        TimeLineView(),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  const Image(image: AssetImage("assets/prizesandrewards.png")),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  Container(
                    height: 730,
                    width: 1255,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: const Image(image: AssetImage("assets/Sponsors Page.png"))
                  ),
                  const Divider(
                    thickness: 1.25,
                    color: Colors.white10,
                  ),
                  const Image(
                    image: AssetImage("assets/Ends.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget header(bool isMobile){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          dualToneText(36, t1: "get", t2: "linked", flipped: false),
          SizedBox(
            width: 423,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  isMobile ? 
              [
      
              ]: const [
                Text("Timeline"),
                Text("Overview"),
                Text(("FAQs")),
                Text("Contact"),
              ],
            ),
          ),
            Button(text: "Register", action: () => {}),
        ],
      ),
    );
  }
  
  Widget heroLeftHalf(bool isMobile){
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isMobile? CrossAxisAlignment.center: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "getlinkedTech",
          //   style: TextStyle(
          //     fontSize: isMobile ? 32: 80,
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(height: 4.0),
          // dualToneText(isMobile ? 32: 80, t1: "Hackathon", t2: "1.0", flipped: false),
          const Image(image: AssetImage("assets/heroleft.png")),
          const SizedBox(height: 8.0),
          Button(text: "Register", action: (){}),
          const SizedBox(height: 8.0),
          countdownTimer(false), //TODO: Make Dynamic
        ],
      ),
    );
  }
  
  Widget heroRightHalf(bool isMobile){
    return Stack(
      alignment: AlignmentDirectional.center,
      children: const [
        Image(
            image: AssetImage("assets/man-wearing-smart-glasses-touching-virtual-screen 1.png"),
          ),
        Image(
          image: AssetImage("assets/sphereWithDots.png"),
        ),
      ],
    );
  }

  Widget countdownTimer(bool isMobile){
    seconds == 0 ? {
      seconds = 59,
      minutes -= 1,
      } : seconds -= 1;

    if(minutes == 0 ) {
      minutes = 59;
      hours -= 1;
      }
    
    return SizedBox(
      width: isMobile ? 220: 285,
      child: Row(
        children: [
          Text.rich(
            TextSpan(
            text: hours.toString(),
            style: TextStyle(
              fontSize: isMobile ? 48 : 64,
            ),
            children: [
              const TextSpan(
                text: "h",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: minutes.toString(),
                style: TextStyle(
                  fontSize: isMobile ? 48 : 64,
                ),
              ),
              const TextSpan(
                text: "m",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: seconds.toString(),
                style: TextStyle(
                  fontSize: isMobile ? 48 : 64,
                ),
              ),
              const TextSpan(
                text: "s",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ]
            )
          )
        ],
      ),
    );
  }
}

Widget dualToneText(double size, {required String t1, required String t2, required bool flipped}){
  return flipped ? Text.rich(
    TextSpan(
      text: t1,
      style: TextStyle(
        fontSize: size+4,
        color: const Color(0xFFD434FE),
      ),
      children: <InlineSpan>[
        TextSpan(
          text: t2,
          style: TextStyle(
            fontSize: size,
            color: Colors.white70,
          ),
        )
      ]
    )
  ) : Text.rich(
    TextSpan(
      text: t1,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      children: <InlineSpan>[
        TextSpan(
          text: t2,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFD434FE)
          ),
        )
      ]
    )
  );
}

Widget expos(bool isMobile, {required String text1, required String text2, required String bodyText}){
  return SizedBox(
    width: isMobile ? 321 : 527,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          )
        ),
        Text(
          text2,
          style: const TextStyle(
            color: Color(0xFFD434FE),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          bodyText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w200,
            color: Colors.white70,
          )
        )
      ]
    ),
  );
}

