var href = window.location.href;
var storage = chrome.storage.local;
if (href.indexOf("checkout") == -1) {
//deal with ajax load
    if (href.indexOf("op/") != -1 && href.indexOf("op/") != href.length - 4) {
        rock();//for open the item in new tab, now click from index
    }

    document.addEventListener('DOMNodeInserted', function (e) {
        var element = e.target;
        if (element == document.getElementsByClassName('cart-button')) {
            rock();
        }
    });

    function rock() {
        storage.get(["size", 'ac', "cl", "location", "shoeSize", "hs"],
            function (i) {
                var has_size = false;
                var size = i.size;
                var auto_cart = i.ac;
                var one_click = i.cl;
                var shoeSize = i.shoeSize;
                var hat_size = i.hs;
//        none jquery
                var sizeSel = document.querySelectorAll("option");
//                    no select, default value
                if (sizeSel.length == 0) {
                    has_size = true;
                } else {
                    Array.prototype.forEach.call(sizeSel, function (el, i) {
                        var elc = el.textContent.replace(".0", "");
                        if (elc == size || elc == shoeSize || elc == hat_size) {
                            el.setAttribute('selected', 'selected');
                            has_size = true;
                        }

                    });
                }
                if (has_size && auto_cart) {
                    var submitbutton = document.querySelectorAll("input.button")[0];
                    if (submitbutton && !submitbutton.classList.contains("remove")) {
                        submitbutton.click();
                    }
                }

                if (one_click) {
                    var a = setInterval(function () {
                        var cart = document.querySelectorAll("#cart.hidden")[0];
                        if (!cart && window.location.toString().indexOf("p/cart") == -1) { // if not in cart page
                            var checkout = document.querySelectorAll("a.button.checkout")[0];
                            checkout.click();
                            window.open("https://www.supremenewyork.com/checkout", "_self");
                            clearInterval(a);
                        }
                    }, 10);
                }
            });
    }

}



