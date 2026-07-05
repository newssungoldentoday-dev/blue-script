// engine.dart
import 'repository.dart'; // Import your new registry

class ComEngine {
  static Future<List<String>> process(String input) async {
    final parts = input.trim().split(' ');
    final command = parts[0];

    if (command == 'mashroom') {
      String action = parts[1];
      String pkg = parts.sublist(2).join(' ');
      
      if (action == 'install') {
        return [MashroomRegistry.sprout(pkg), "[Zetpleta.cm]: end."];
      } else if (action == 'remove') {
        return [MashroomRegistry.purge(pkg), "[Zetpleta.cm]: end."];
      }
    }
    return ["Com-Kernel: Command not routed."];
  }
}
// engine.dart - The Yielding-Gather Loop
static Stream<String> startLogcatLoop() async* {
  int counter = 0;
  double summationValue = 0.0;

  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    counter++;
    summationValue += 12.5; // Simulate adding pings or business data points

    yield "[Live-Stream] #Cycle_$counter | Sum: $summationValue | Status: #Operational";
    
    // We break the loop if the user types 'stop'
  }
}

