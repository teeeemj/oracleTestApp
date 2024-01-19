import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:testapp/core/data/user_data.dart';
import 'package:testapp/modules/authorization/presentations/screens/start_screen.dart';

import '../../../modules/authorization/presentations/screens/after_register_page.dart';
import '../../../modules/authorization/presentations/screens/login_page.dart';
import '../../../modules/authorization/presentations/screens/register_page.dart';
import '../../../modules/disvocer/screens/discover_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: StartRoute.page, initial: true),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: AfterRegisterRoute.page),
        AutoRoute(page: DiscoverRoute.page)
      ];
  final userDataProvider = ChangeNotifierProvider<UserData>(
    create: (context) => UserData(),
  );
}
