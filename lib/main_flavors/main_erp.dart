import 'package:flavordinamico/core/constants/global_variables.dart';

import '../main.dart' as main_common;
import '../flavors.dart';
Future<void> main() async {
  GlobalVariables().companyID = "95320";
  Flavor.flavorTypes = FlavorTypes.hamonerp;
  main_common.main();
}