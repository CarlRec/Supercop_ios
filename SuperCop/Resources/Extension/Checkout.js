var storage = chrome.storage.local;
$(document).ready(function () {
    loadInfo();


    function saveInfo() {
        var userInfo = {};
        userInfo.name = $("#name").val();
        userInfo.email = $("#email").val();
        userInfo.tel = $("#tel").val();
        userInfo.street = $("#street").val();
        userInfo.street2 = $("#street2").val();
        userInfo.zip = $("#zip").val();
        userInfo.city = $("#city").val();
        userInfo.state = $("#state").val().toUpperCase();
        userInfo.c_num = $("#c_num").val();
        userInfo.cvv = $("#cvv").val();
        userInfo.exp_month = $("#exp_month").val();
        userInfo.exp_year = $("#exp_year").val();

        localStorage["userInfo"] = JSON.stringify(userInfo);
        storage.set({"userInfo": userInfo}, function () {
        });

    }

    function loadInfo() {
        storage.get("userInfo", function (items) {
            var userInfo = items.userInfo;
            if (userInfo.length != 0) {
                $("#clear").show();
                $("#name").val(userInfo.name);
                $("#email").val(userInfo.email);
                $("#tel").val(userInfo.tel);
                $("#street").val(userInfo.street);
                $("#street2").val(userInfo.street2);
                $("#zip").val(userInfo.zip);
                $("#city").val(userInfo.city);
                $("#state").val(userInfo.state);
                var country = localStorage.country;
                $("li[value=" + country + "]").css("background-color", "red");
                var card = localStorage.card;
                $("li[value=" + card + "]").css("background-color", "red");
                $("#c_num").val(userInfo.c_num);
                $("#cvv").val(userInfo.cvv);
                $("#exp_month").val(userInfo.exp_month);
                $("#exp_year").val(userInfo.exp_year);
            }
        });
    }

    $(".country").each(function () {
        $(this).click(function () {
            $(".country").css("background-color", "black");
            $(this).css("background-color", "red");
            var country = $(this).attr("value");
            localStorage.country = country;
            chrome.storage.local.set({"country": country});
        });
    });
    $(".card").each(function () {
        $(this).click(function () {
            $(".card").css("background-color", "black");
            $(this).css("background-color", "red");
            var card = $(this).attr("value");
            localStorage.card = card;
            chrome.storage.local.set({"card": card});
        });
    });

    $("#sb").click(function () {
        saveInfo();
        $("#sb").text("Saved!");
    });

    $("#clear").click(function () {
        var clear = confirm("Are you sure to clear all the information?");
        if (clear) {
            localStorage.userInfo = "";
            localStorage.country = "";
            localStorage.card = "";
            storage.clear(function () {
            });
        }
    });

});