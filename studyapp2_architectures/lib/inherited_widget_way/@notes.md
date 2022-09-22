## Summing up learning results

1. InheritedWidgets must be as small as possible (must use Single Responsibility Principle to split the logic)
2. InheritedWidgets are immutable (I'll have to wrap InheritedWidget with the Statefull widget to provide better app state management - a large amount of boilerplate code)
3. There are must be one place where to initialize InheritedWidgets, for example in Scaffolds (It improves code purity)
4. App tree updates only widgets which uses InheritedWidgets states, unlike standart method with props
5. dependOnInheritedWidgetOfExactType() register widgets that are using InheritedWidget therefore whenever any change happens it will rebuilt those widgets even if they are not using data (to solve this using findAncestorWidgetOfExactType())
6. When need to add some state variable it must be duplicated and passed to InheritedWidget constructor (DRY fails). At this moment I have no idea how to avoid this issue and create better structure (Neither interfaces nor maps solves the problem)

I'm going to read Provider and BLoC libs code implementations to find answers.