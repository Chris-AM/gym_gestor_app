import 'package:flutter/material.dart';
import 'package:gym_gestor_app/features/shared/widgets/widgets.dart';
import '/features/home/presentation/views/views.dart';

class HomeScreen extends StatefulWidget {
  static String name = 'HomeScreen!!';
  final int screenIndex;
  const HomeScreen({
    super.key,
    required this.screenIndex,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    TrainView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_pageController.hasClients) {
      _pageController.animateToPage(
        widget.screenIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: widget.screenIndex,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
