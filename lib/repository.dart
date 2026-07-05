// repository.dart

class MashroomRegistry {
  // A list of packages currently in the ecosystem
  static final Map<String, bool> installedPackages = {
    "NumBra": false,
    "Labera": false,
    "MushCrap": false,
    "Mushroom Soup": false,
    "Dug": false,
    "Echo": false,
  };

  static String sprout(String pkg) {
    if (installedPackages.containsKey(pkg)) {
      installedPackages[pkg] = true;
      return "[Mashroom]: '$pkg' has successfully sprouted in your system.";
    }
    return "[Mashroom]: Error - '$pkg' not found in the manifest.";
  }

  static String purge(String pkg) {
    if (installedPackages.containsKey(pkg)) {
      installedPackages[pkg] = false;
      return "[Mashroom]: '$pkg' has been purged.";
    }
    return "[Mashroom]: Package '$pkg' is not currently sprouted.";
  }
}
