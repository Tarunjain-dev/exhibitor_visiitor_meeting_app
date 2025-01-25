import 'package:exhibitor_visiitor_meeting_app/app/screens/auth/forgotPassword/forgot_password_screen.dart';
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

  static final routes = [
    GetPage(name: "/", page: ()=> SplashScreen()),
    GetPage(name: "/login", page: ()=> LoginScreen()),
    GetPage(name: "/signup", page: ()=> SignupScreen()),
    GetPage(name: "/forgotPassword", page: ()=> ForgotPasswordScreen()),
    GetPage(name: "/visitorDashboardBottomNavigation", page: ()=> VisitorDashboardBottomNavigation()),
    GetPage(name: "/visitorHome", page: ()=> VisitorHomeScreen()),
    GetPage(name: "/sellerList", page: ()=> SellerListScreen()),
    GetPage(name: "/visitorScheduleNewMeeting", page: ()=> VisitorScheduleNewMeetingScreen()),
    GetPage(name: "/visitorLiveChatting", page: ()=> VisitorLiveChattingScreen()),
    GetPage(name: "/visitorProfile", page: ()=> VisitorProfileScreen()),
    GetPage(name: "/editVisitorProfile", page: ()=> EditVisitorProfileScreen()),
    GetPage(name: "/exhibitorDashboardBottomNavigation", page: ()=> ExhibitorDashboardBottomNavigation()),
    GetPage(name: "/buyerList", page: ()=> BuyerListScreen()),
    GetPage(name: "/exhibitorHome", page: ()=> ExhibitorHomeScreen()),
    GetPage(name: "/exhibitorLiveChatting", page: ()=> ExhibitorLiveChattingScreen()),
    GetPage(name: "/exhibitorProfile", page: ()=> ExhibitorProfileScreen()),
    GetPage(name: "/exhibitorScheduleNewMeeting", page: ()=> ExhibitorScheduleNewMeetingScreen()),
    GetPage(name: "/eventMap", page: ()=> EventMapScreen()),
  ];
}
