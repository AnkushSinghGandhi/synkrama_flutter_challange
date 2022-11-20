import 'package:flutter/material.dart';
import 'package:synkrama/constants/routes.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/videoplayback.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
            children: [
              VideoPlayerWidget(controller: controller),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Text(
                    'N/n',
                    style: TextStyle(
                        color: Color.fromARGB(199, 255, 255, 255),
                        fontSize: 17),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Text(
                    'The Compass',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Text(
                    'Shoulder internal rotation',
                    style: TextStyle(color: Color.fromARGB(169, 255, 255, 255)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 37,
                child: Row(children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      'Lie on your side',
                      style:
                          TextStyle(color: Color.fromARGB(169, 255, 255, 255)),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 37,
                child: Row(children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      'Arm positioned 90 to the chest and elbow bent to 90',
                      style:
                          TextStyle(color: Color.fromARGB(169, 255, 255, 255)),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 37,
                child: Row(children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      'Keep your shoulder on the ground',
                      style:
                          TextStyle(color: Color.fromARGB(169, 255, 255, 255)),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 37,
                child: Row(children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      'Lifting your shoulder of the ground',
                      style:
                          TextStyle(color: Color.fromARGB(169, 255, 255, 255)),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 37,
                child: Row(children: const [
                  SizedBox(
                    width: 27,
                  ),
                  Icon(
                    Icons.add_circle_outline_sharp,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      'Place your hand and wrist on the floor',
                      style:
                          TextStyle(color: Color.fromARGB(169, 255, 255, 255)),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      landscapeViewRoute,
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          )),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 47,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                loginRoute,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return controller != null && controller.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        :
        // ignore: sized_box_for_whitespace, dead_code
        Container(
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget buildVideo() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
