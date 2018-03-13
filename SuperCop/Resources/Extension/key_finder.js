var storage = chrome.storage.local;
var shop_rul = "http://www.supremenewyork.com";
storage.get(["kw", "ic", "kf"], function (item) {
    var kf = item.kf;
    if (kf == true) {
        var kw = item.kw;
        var ic = item.ic;
        var href = window.location.href;
        var new_kw = kw + " " + ic;
        new_kw = new_kw.toString().replace(/\s+/g, ".*");
        new_kw = "shop/.*" + new_kw + ".*";
        new_kw = new RegExp(new_kw);

        if (href.indexOf("all") == -1) {
            key_finder('li>a', new_kw);
        } else {
            key_finder('article>a', new_kw);
        }
        function key_finder(selector, keyword) {
            var el = document.querySelectorAll(selector);
            var find = false;
            Array.prototype.forEach.call(el, function (e, i) {
                var name = e.getAttribute("href");
//                if (name.indexOf(keyword) != -1) {
                if (keyword.test(name)) {
                    console.log(name);
                    window.location = shop_rul + name;
                    find = true;
                    return false;
                }
            });
            if (!find) {
//                setTimeout(function () {
                    window.location.reload();
//                }, 5 * 1000);

            }
        }
    }
});