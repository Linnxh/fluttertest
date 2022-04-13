import 'package:flutter/cupertino.dart';

import 'CustomPlayListItem.dart';

class CustomSliverGrid extends StatelessWidget {
  final List<StatelessWidget> children;

  const CustomSliverGrid({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      childAspectRatio: 0.78,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: children,
    );
  }
}
