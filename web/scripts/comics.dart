import 'dart:html';
import 'dart:convert';

main() {
    
    // Query for comic list
    var list_el = document.query('#comics-list');

    // Create Ajax request object
    var req = new HttpRequest();

    // Configure and send the request
    req.open('get', '/comics');
    req.onLoad.listen((req) {
        var list = JSON.decode(req.target.responseText);
        list_el.innerHtml = graphic_novels_template(list);
    });
    req.send();
}

graphic_novels_template(list) {
    var html = '';
    list.forEach((graphic_novel) {
        html += graphic_novel_template(graphic_novel);
    });
    return html;
}

graphic_novel_template(graphic_novel) {
    return '''
        <li id="${graphic_novel['id']}">
            ${graphic_novel['title']}
            <a class="delete" href="#">[delete]</a>
        </li>''';
}
