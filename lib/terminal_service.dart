import 'dart:async';
import 'local/dasata_config.dart';

class TerminalService {
  // Summation data for -yg loop
  static double _summation = 0.0;
  static int _cycle = 0;

  // Processes the command string
  static Future<String> execute(String input) async {
    final parts = input.split(' ');
    final command = parts[0];

    if (command == 'logcat' && parts.contains('-yg')) {
      return "Loop_Active_#Summation_Enabled";
    }

    if (command == 'read' && input.endsWith('.local')) {
      return "#File_Found_#Parsing_Tags";
    }

    return "#Status_Command_Executed";
  }

  // The Yielding-Gather Loop (-yg)
  static Stream<String> getSummationStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      _cycle++;
      _summation += 12.5; // Represents your DasaTa ping or Shop revenue

      yield "#Cycle_$_cycle | #Summation_$_summation | #Status_Operational";
    }
  }
}
