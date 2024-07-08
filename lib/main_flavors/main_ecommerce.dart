import 'package:flavordinamico/core/constants/global_variables.dart';

import '../main.dart' as main_common;
import '../flavors.dart';

Future<void> main() async {
  GlobalVariables().companyID = "36820";
  Flavor.flavorTypes = FlavorTypes.harmonecommerce;
  main_common.main();
}