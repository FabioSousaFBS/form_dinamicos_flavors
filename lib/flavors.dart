enum FlavorTypes { hamonerp, harmonecommerce }

class Flavor {

  Flavor._instance();

  static late FlavorTypes flavorTypes;

  static String get flavorMessage{
    switch (flavorTypes) {
      case FlavorTypes.hamonerp:
        return 'HarmonErp';
      case FlavorTypes.harmonecommerce:
        return 'HarmonECommerce';
      default:
        return 'HarmonErp';
    }   
  }

  // static String get apiBaseUrl {
  //   switch (flavorType) {
  //     case FlavorTypes.dev:
  //       return 'apiUrlBaseDev';
  //     case FlavorTypes.prod:
  //       return 'apiUrlBaseProd';
  //     default:
  //       return 'apiUrlBaseDev';
  //   }
  // }

  static bool isEcommerce() => flavorTypes == FlavorTypes.harmonecommerce;
  static bool isErp() => flavorTypes == FlavorTypes.hamonerp;

}