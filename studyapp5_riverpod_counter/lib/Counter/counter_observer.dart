import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print("\n[Provider update] Counter Logger: provider: $provider previous value: $previousValue new value: $newValue\n");
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

}