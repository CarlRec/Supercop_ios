$(document).ready(function () {
    if (localStorage.cl == "true") {
        $("#if_one_click").attr('checked', 'checked');
    } else {
        $("#if_one_click").removeAttr('checked');
    }
    if (localStorage.ac == "true") {
        $("#if_auto_cart").attr('checked', 'checked');
    } else {
        $("#if_auto_cart").removeAttr('checked');
    }
    if (localStorage.kf == "true") {
        $("#kfswitch").attr('checked', 'checked');
        $(".kware").show();
    } else {
        $("#kfswitch").removeAttr('checked');
        $(".kware").hide();
    }

    var size = localStorage.size;
    $('li[value="' + size + '"]').css("background-color", "red");

    $(".size").each(function () {
        $(this).click(function () {
            $(".size").css("background-color", "black");
            $(this).css("background-color", "red");
            var size = $(this).attr("value");
            localStorage.size = size;
            chrome.storage.local.set({"size": size});
        });
    });

    $("#shoes").val(localStorage.shoeSize);
    if(localStorage.kw){
        $("#keyword").val(localStorage.kw);
    }
    if (localStorage.ic) {
        $("#item_color").val(localStorage.ic);
    }

    $("#hat_size").val(localStorage.hs);


    $("#sb").click(function () {
        var one_click = $("#if_one_click").is(":checked");
        var auto_cart = $("#if_auto_cart").is(":checked");
        var shoeSize = $("#shoes").val();
        var key_finder = $("#kfswitch").is(":checked");
        var kw = $("#keyword").val().trim();
        var item_color = $("#item_color").val().trim();
        var hat_size = $("#hat_size").val();
        if (key_finder && kw == "") {
            alert("Please set the keyword");
        } else {
            localStorage.shoeSize = shoeSize;
            localStorage.cl = one_click;
            localStorage.ac = auto_cart;
            localStorage.kf = key_finder;
            localStorage.kw = kw.toLowerCase();
            localStorage.ic = item_color.toLowerCase();
            localStorage.hs = hat_size;
            chrome.storage.local.set({cl: one_click, ac: auto_cart,
                shoeSize: shoeSize, kw: kw.toLowerCase(),
                ic: item_color.toLowerCase(), kf: key_finder, hs: hat_size}, function () {
            });
            $(this).text("Saved!");
            setTimeout(function () {
                $("#sb").text("Save");
            }, 2000)
        }
    });

    $("#kfswitch").click(function () {
        if ($(this).is(":checked")) {
            $(".kware").slideDown(150);
        } else {
            $(".kware").slideUp(150);
        }

    });

});
