import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreController extends GetxController {
  Future<void> launchURLfacebook() async {
    final url =
        "https://www.facebook.com/bpkh.yogyakarta";
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchURLTwiter() async {
    final url =
        "https://twitter.com/BPKHwilayah11";
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchURLIg() async {
    final url =
        "https://www.instagram.com/bpkhwilayah11yogyakarta/?hl=id";
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchURLYt() async {
    final url =
        "https://www.youtube.com/channel/UCvVv41NkzCYIg9sEpCNRMig";
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
