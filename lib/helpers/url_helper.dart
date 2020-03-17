import 'package:brave_developers_test_app/res/strings.dart';
import 'package:url_launcher/url_launcher.dart';

void sendEmail() async {
  if (await canLaunch(Strings.mailUrl)) {
    await launch(Strings.mailUrl);
  } else {
    throw 'Could not launch ${Strings.mailUrl}';
  }
}

void openGithub() async {
  if (await canLaunch(Strings.gitHubUrl)) {
    await launch(Strings.gitHubUrl);
  } else {
    throw 'Could not launch ${Strings.gitHubUrl}';
  }
}
