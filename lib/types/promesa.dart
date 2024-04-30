import 'package:http/http.dart' as http;
import 'package:arnoldsuate_actividad2_2/types/image.dart';

void imprimirLista(Image photo) {
  print("ID Album: ${photo.id}");
  print("ID: ${photo.albumId}");
  print("Titulo: ${photo.title}");
  print("URL: ${photo.url}");
  print("Thumbnail URL: ${photo.thumbnailUrl}");
  print('=======================================================');
}

void main(List<String> args) async {
  var url = Uri.https('jsonplaceholder.typicode.com','/photos');

  try {
    var jsonPost = await http.get(url);
    if (jsonPost.statusCode == 200) {
      final images = imageFromJson(jsonPost.body);
      for (var image in images) {
        imprimirLista(image);
      }
    } else{
      print("Error");
    }
  } catch (e) {
    print(e.toString());
  }
}
