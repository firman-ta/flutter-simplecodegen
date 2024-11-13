import 'package:flutter/material.dart';
import 'package:simplecodegen/controller/feed_controller.dart';
import 'package:simplecodegen/view/feed_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FeedController>(context, listen: false).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SimpleCodeGen',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          controller.fetch();
        },
        child: controller.isFetching
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.length,
                itemBuilder: (context, index) => FeedCard(
                  feed: controller.feedList[index],
                ),
              ),
      ),
    );
  }
}
