import 'package:flutter/material.dart';
import 'package:studyapp2_architectures/inherited_widget_way/user_info.dart';
import 'package:studyapp2_architectures/inherited_widget_way/user_state.dart';

class InheritedWay extends StatelessWidget {
  const InheritedWay({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget architecture"),
        centerTitle: true,
      ),
      body: const UserState(
        child: Layout(),
      ),
    );
  }
}

class Layout extends StatelessWidget {
  const Layout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(child: UserInfo()),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            onPressed: () => UserState.of(context).kill(),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
