import 'package:flutter/material.dart';

import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/size_extensions.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/messages.dart';
import '../controller/home_controller.dart';
import '../widgets/empty_box.dart';
import '../widgets/movie_tile.dart';
import '../widgets/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  HomeController controller = HomeController();
  final debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.state.addListener(_handleStateChange);
    });
    super.initState();
  }

  void _handleStateChange() async {
    switch (controller.state.value) {
      case HomeState.initial:
        break;
      case HomeState.loading:
        showLoader();
        break;
      case HomeState.loaded:
        hideLoader();
        break;
      case HomeState.error:
        hideLoader();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, context.statusBarHeight + 24, 24, 0),
        child: Column(
          children: [
            SearchField(
              controller: controller.searchText,
              onChanged: (value) {
                debouncer.call(() async {
                  await controller.setSearch(value);
                });
              },
            ),
            ListenableBuilder(
              listenable: Listenable.merge([controller.movies]),
              builder: (context, _) {
                return controller.movies.value.isEmpty
                    ? const EmptyBox()
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 148 / 219,
                          ),
                          itemCount: controller.movies.value.length,
                          itemBuilder: (context, index) =>
                              MovieTile(controller.movies.value[index]),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
