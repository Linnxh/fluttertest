import 'package:fluttertest/redux/reducers.dart';

class AppState {
  List banners; // 轮播图
  AppState({required this.banners});
}

AppState appReducer(AppState state, action) {
  return AppState(banners: bannerReducer(state.banners, action));
}
