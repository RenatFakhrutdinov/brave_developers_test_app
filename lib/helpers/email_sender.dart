import 'package:brave_developers_test_app/res/strings.dart';
import 'package:url_launcher/url_launcher.dart';

void sendEmail() async {
  if (await canLaunch(Strings.mailUrl)) {
    await launch(Strings.mailUrl);
  } else {
    throw 'Could not launch ${Strings.mailUrl}';
  }
}
