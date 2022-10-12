import 'package:studyapp7_streams/controller.dart';

void main(List<String> arguments) async {
  final service = UserService();
  final subscription = service.stream.listen((event) => print(event));
  await service.generateEvents();

  // wait a while because subscription cancels immediately as last event emmited
  // listen method does not have time to handle event
  await Future.delayed(Duration(milliseconds: 500));
  
  subscription.cancel();
}
