var tabs = chrome.tabs;
var storage = chrome.storage.local;

function rock(url) {
    tabs.create({url: url}, function (tab) {
    });
}
chrome.extension.onMessage.addListener(function (req, sender, sendResponse) {
    var method = req.method;

    if (method == "rock") {
        urls = localStorage.url.split("\n");
        for (var i = 0; i < urls.length; i++) {
            rock(urls[i].trim(), localStorage.size);
        }
    }
    else if (method == "store") {
        var url = req.item_url;
        var size = req.item_size;
        var one_click = req.cl;
        localStorage.url = url;
        localStorage.size = size;
        storage.set({size: size, cl: one_click}, function () {
            rock("http://www.supremenewyork.com/shop", localStorage.size);
        });
    }
});

chrome.tabs.onUpdated.addListener(function (tabid, changeInfo, tab) {
    if (tab.url.indexOf("supremenewyork.com") != -1 && tab.url != localStorage["curl"] && tab.url.indexOf("checkout") == -1) {
//        chrome.tab.reload(tab.id, function () {
//            localStorage["curl"] = tab.url;
//        });
        var a = 0;
        var b = setInterval(function () {
            chrome.storage.local.get(["size", "shoeSize", "hs"], function (i) {
                var code = 'var sizeSelect = document.querySelectorAll("option");' +
                    'Array.prototype.forEach.call(sizeSelect, function (el, i) {' +
                    'if (el.textContent =="' + i.size + '" || el.textContent == "'
                    + i.shoeSize + '" || el.textContent == "' + i.hs + '") {' +
                    'el.setAttribute(\'selected\', \'selected\');' +
                    '}' +
                    '}); ';

                chrome.tabs.executeScript(tabid, {code: code}, function () {
                    a += 1;
                    if (a == 5) {
                        clearInterval(b);
                    }
                });
            });
        }, 500);
    }
    else if (tab.url.indexOf("checkout") != -1) {
        chrome.tabs.executeScript(tabid, {file: "jquery-2.0.3.min.js", runAt: "document_end"}, function () {
            chrome.tabs.executeScript(tabid, {file: "main.js", runAt: "document_end"}, function () {
            });
        });


    }
    if (tab.url.indexOf("op/") != -1 && tab.url != "http://www.supremenewyork.com/shop/cart") {
        chrome.tabs.executeScript(tabid, {file: "auto_shop.js", runAt: "document_end"}, function () {
        });
    }
});

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-48748726-2']);
_gaq.push(['_trackPageview']);

(function () {
    var ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = 'https://ssl.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ga, s);
})();