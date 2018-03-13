var storage = chrome.storage.local;
$(document).ready(function () {
    loadInfo();
    function saveInfo() {
        var userInfo = {};
        userInfo.fName = $("#fName").val();
        userInfo.lName = $("#lName").val();
        userInfo.email = $("#email").val();
        userInfo.tel = $("#tel").val();
        userInfo.state = $("#state").val();
        userInfo.city = $("#city").val();
        userInfo.street = $("#street").val();
        userInfo.zip = $("#zip").val();
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
                $("#fName").val(userInfo.fName);
                $("#lName").val(userInfo.lName);
                $("#email").val(userInfo.email);
                $("#tel").val(userInfo.tel);
                $("#street").val(userInfo.street);
                $("#zip").val(userInfo.zip);
                $("#city").val(userInfo.city);
                $("#state").val(userInfo.state);
                var card = localStorage.card;
                $("li[value=" + card + "]").css("background-color", "red");
                if (card == "cod") {
                    $("#cardInfo").toggle();
                } else {
                    $("#c_num").val(userInfo.c_num);
                    $("#cvv").val(userInfo.cvv);
                    $("#exp_month").val(userInfo.exp_month);
                    $("#exp_year").val(userInfo.exp_year);
                }
            }
        });
    }

    $(".card").each(function () {
        $(this).click(function () {
            $(".card").css("background-color", "black");
            $(this).css("background-color", "red");
            var card = $(this).attr("value");
            localStorage.card = card;
            chrome.storage.local.set({"card": card});
            if (card == "cod") {
                $("#cardInfo").toggle();
            } else {
                $("#cardInfo").show();
                loadInfo();
            }
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
            localStorage.card = "";
            storage.clear(function () {
            });
        }
    });

});