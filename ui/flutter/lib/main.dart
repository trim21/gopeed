import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/libgopeed_boot.dart';
import 'routes/router.dart';
import 'setting/setting.dart';
import 'theme/theme.dart';
import 'util/log_util.dart';
import 'util/mac_secure_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await LibgopeedBoot.instance.start();
    await Setting.instance.load();
  } catch (e) {
    logger.e("init fail", e);
  }
  MacSecureUtil.loadBookmark();

  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: GopeedTheme.light,
    darkTheme: GopeedTheme.dark,
    themeMode: Setting.instance.themeMode,
    getPages: Routes.routes,
  ));
}
