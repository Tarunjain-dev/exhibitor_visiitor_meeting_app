import 'package:exhibitor_visiitor_meeting_app/app/screens/auth/forgotPassword/forgot_password_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/auth/login/getx/binding.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/auth/login/login_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/auth/signup/signup_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/common/eventMap/event_map.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/exhibitorPortion/exhibitorDashboard/buyerList/buyer_list_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/exhibitorPortion/exhibitorDashboard/home/exhibitor_home_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/exhibitorPortion/exhibitorDashboard/liveChat/exhibitor_live_chat_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/exhibitorPortion/exhibitorDashboard/profile/exhibitor_profile_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/exhibitorPortion/exhibitorDashboard/scheduleNewMeeting/exhibitor_schedule_new_meeting_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/exhibitorPortion/exhibitor_dashboard_bottom_navigation.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/splash/splash_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/home/visitors_home_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/liveChat/visitors_live_chat_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/profile/edit_visitor_profile_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/profile/visitors_profile_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/scheduleNewMeeting/visitors_schedule_new_meeting_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitorDashboard/sellerList/seller_list_screen.dart';
import 'package:exhibitor_visiitor_meeting_app/app/screens/visitorPortion/visitor_dashboard_bottom_navigation.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = '/';
  static const loginRoute = '/login';
  static const signupRoute = '/signup';
  static const forgotPasswordRoute = '/forgotPassword';
  static const visitorDashboardBottomNavRoute = '/visitorDashboardBottomNav';
  static const visitorHomeRoute = '/visitorHome';
  static const sellerListRoute = '/sellerList';
  static const visitorScheduleNewMeetRoute = '/visitorScheduleNewMeet';
  static const visitorLiveChattingRoute = '/visitorLiveChatting';
  static const visitorProfileRoute = '/visitorProfile';
  static const editVisitorProfileRoute = '/editVisitorProfile';
  static const exhibitorDashboardBottomNavRoute = '/exhibitorDashboardBottomNav';
  static const buyersListRoute = '/buyersList';
  static const exhibitorHomeRoute = '/exhibitorHome';
  static const exhibitorLiveChattingRoute = '/exhibitorLiveChatting';
  static const exhibitorProfileRoute = '/exhibitorProfile';
  static const exhibitorScheduleNewMeetRoute = '/exhibitorScheduleNewMeet';
  static const eventMapRoute = '/eventMap';

  static final routes = [
    GetPage(name: "/", page: ()=> SplashScreen()),
    GetPage(name: loginRoute, page: ()=> LoginScreen(), binding: LoginBinding()),
    GetPage(name: signupRoute, page: ()=> SignupScreen()),
    GetPage(name: forgotPasswordRoute, page: ()=> ForgotPasswordScreen()),
    GetPage(name: visitorDashboardBottomNavRoute, page: ()=> VisitorDashboardBottomNavigation()),
    GetPage(name: visitorHomeRoute, page: ()=> VisitorHomeScreen()),
    GetPage(name: sellerListRoute, page: ()=> SellerListScreen()),
    GetPage(name: visitorScheduleNewMeetRoute, page: ()=> VisitorScheduleNewMeetingScreen()),
    GetPage(name: visitorLiveChattingRoute, page: ()=> VisitorLiveChattingScreen()),
    GetPage(name: visitorProfileRoute, page: ()=> VisitorProfileScreen()),
    GetPage(name: editVisitorProfileRoute, page: ()=> EditVisitorProfileScreen()),
    GetPage(name: exhibitorDashboardBottomNavRoute, page: ()=> ExhibitorDashboardBottomNavigation()),
    GetPage(name: buyersListRoute, page: ()=> BuyerListScreen()),
    GetPage(name: exhibitorHomeRoute, page: ()=> ExhibitorHomeScreen()),
    GetPage(name: exhibitorLiveChattingRoute, page: ()=> ExhibitorLiveChattingScreen()),
    GetPage(name: exhibitorProfileRoute, page: ()=> ExhibitorProfileScreen()),
    GetPage(name: exhibitorScheduleNewMeetRoute, page: ()=> ExhibitorScheduleNewMeetingScreen()),
    GetPage(name: eventMapRoute, page: ()=> EventMapScreen()),
  ];
}
