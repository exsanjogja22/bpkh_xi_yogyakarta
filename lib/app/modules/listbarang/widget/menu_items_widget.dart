import '../models/filter.dart';
import '../models/menu_items.dart';
import 'package:http/http.dart' as http;

class MenuItemsWidget {
  static List<MenuItems> listItemsMenu = [];

  Future<void> filter() async {
    try {
      final response = await http.get(Uri.parse(
          "https://pinjamalat.bpkh11jogja.net/api/pinjam/kategoribarang"));
      if (response.statusCode == 200) {
        final request = filterFromJson(response.body).data;
       
        for (var data in request) {
          listItemsMenu
              .add(MenuItems(id: data.id.toInt(), selection: data.deskripsi.toString()));
        
        }
      } else {
        // ignore: avoid_print
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  
  }
  
}
