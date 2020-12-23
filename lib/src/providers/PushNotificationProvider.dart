
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  static final  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static PushNotificationProvider _singleton;
 
  String pushID="";
  factory PushNotificationProvider(){
    if (_singleton==null){
        _singleton=PushNotificationProvider._internal();
    }
    return _singleton;
  } 
  PushNotificationProvider._internal();  

  initNotifications(){
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.getToken().then((token) {
          print('===FCM TOKEN=====');
          pushID=token;
          print(token);
          //d40jymOMep0:APA91bHyNlzy6IKza_kuZJStPHPkJfVt1Q03MGHTv_qf3Fahp7rJv1A-N1htVCUyiUpVh7Amds1HX5f6piPbMBZDPjfKDhobMyofFEzl-CkCt1TBZxRZWBiAY0yM62x8i3NJJD6v2Qkc
            //IOS
          //djjaemK750G4rupUfuJozK:APA91bGKwl9Xw9O3YoPG1JGZd4Nj_Ezry3pQ5Y9uMig0YAwLx7e0jevojZM21Oo9-1JqOr1I7inRMmg8ojy9SMv1SDwguITIFh7NihoDrnx2JNf9w-PUtgF1MXegq1JPpSIy8d13Z4bY
      });
      _firebaseMessaging.configure(
          onMessage: (info){
             print('=== onMessage=====');
             print(info);
          },
          onLaunch: (info){
             print('===onLaunch=====');
             print(info);
          },
          onResume: (info){
             print('===onResume=====');
             print(info);
          }
      );
  }

}