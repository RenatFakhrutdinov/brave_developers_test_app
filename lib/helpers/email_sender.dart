import 'package:url_launcher/url_launcher.dart';

void sendEmail() async {
  String url =
      'mailto:renat.fakhrutdinov@bravedevelopers.com?subject=Mail from web test app&body= ';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
