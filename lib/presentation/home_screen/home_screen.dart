import 'package:cimb_testcase/common/colors.dart';
import 'package:cimb_testcase/common/enum.dart';
import 'package:cimb_testcase/models/posts/posts.dart';
import 'package:cimb_testcase/presentation/home_screen/logic/home_provider.dart';
import 'package:cimb_testcase/presentation/home_screen/posts/posts_card.dart';
import 'package:cimb_testcase/presentation/widget/shimmer.dart';
import 'package:cimb_testcase/presentation/widget/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/bottom_sheet.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;
  TabController? _controller;
  List<Widget> tabs = [
    const Tab(
        child: Text(
      'Main List',
      style: TextStyle(color: Colors.white),
    )),
    const Tab(
        child: Text(
      'Favorite List',
      style: TextStyle(color: Colors.white),
    ))
  ];

  @override
  void initState() {
    super.initState();
    ref.read(homeProvider).fetchPosts();
    Future.delayed(
        const Duration(milliseconds: 1000),
        () => WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                startAnimation = true;
              });
            }));
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.hexToColors('a70103'),
      body: SafeArea(child: Consumer(
        builder: (context, ref, child) {
          final completedPosts = ref.watch(homeProvider);
          screenHeight = MediaQuery.of(context).size.height;
          screenWidth = MediaQuery.of(context).size.width;
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TabBar(
                controller: _controller,
                tabs: tabs,
                indicatorColor: Colors.white,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: TabBarView(controller: _controller, children: [
                  completedPosts.homeState.state == RequestState.success
                      ? ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: completedPosts.homeState.posts.length,
                          itemBuilder: (context, index) {
                            return CardPosts(
                                    posts:
                                        completedPosts.homeState.posts[index],
                                    screenWidth: screenWidth,
                                    startAnimation: startAnimation)
                                .animate()
                                .fade()
                                .fadeIn(
                                    duration: Duration(
                                        milliseconds: 100 + (index * 200)));
                          },
                        )
                      : const ShimmerPosts(),
                  completedPosts.homeState.state == RequestState.success
                      ? ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: completedPosts.postsFavorite.length,
                          itemBuilder: (context, index) {
                            return CardPosts(
                                    posts: completedPosts.postsFavorite[index],
                                    screenWidth: screenWidth,
                                    startAnimation: startAnimation)
                                .animate()
                                .fade()
                                .fadeIn(
                                    duration: Duration(
                                        milliseconds: 100 + (index * 200)));
                          },
                        )
                      : const ShimmerPosts(),
                ]),
              ),
            ],
          );
        },
      )),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 216, 141, 141),
        onPressed: () => addForm(context: context),
        tooltip: 'Add Posts',
        child: Icon(
          Icons.add,
          color: ConstColors.hexToColors('a70103'),
        ),
      ),
    );
  }

  addForm({
    required context,
  }) {
    TextEditingController txtTitle = TextEditingController();
    TextEditingController txtBody = TextEditingController();
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (context) => BottomSheetWidget.baseSheet(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Add Posts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormCustom.general(txtTitle: txtTitle, title: 'Title'),
            const SizedBox(
              height: 10,
            ),
            TextFormCustom.general(txtTitle: txtBody, title: 'Body'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ConstColors.hexToColors('a70103'),
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                if (txtBody.text != "" && txtTitle.text != "") {
                  ref.read(homeProvider).addPosts(Posts(
                      id: ref.watch(homeProvider).homeState.posts.length + 1,
                      title: txtTitle.text,
                      body: txtBody.text,
                      favorite: false));
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add posts',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
        withTopIndicator: true,
      ),
    );
  }
}
