var storage = chrome.storage.local;
var country = {
    UK: 'GB', AUSTRIA: 'AT', BELARUS: 'BY', BELGIUM: 'BE', BULGARIA: 'BG', CROATIA: 'HR', DENMARK: 'DK', ESTONIA: 'EE',
    FINLAND: 'FI', FRANCE: 'FR', GERMANY: 'DE', GREECE: 'GR', HUNGARY: 'HU', ICELAND: 'IS', IRELAND: 'IE', ITALY: 'IT',
    LATVIA: 'LV', LITHUANIA: 'LT', LUXEMBOURG: 'LU', MONACO: 'MC', NETHERLANDS: 'NL', NORWAY: 'NO', POLAND: 'PL', PORTUGAL: 'PT',
    ROMANIA: 'RO', RUSSIA: 'RU', SLOVAKIA: 'SK', SLOVENIA: 'SI', SPAIN: 'ES', SWEDEN: 'SE', SWITZERLAND: 'CH', TURKEY: 'TR', UKRAINE: 'UA'
};
var mirrorCountry = {
    GB: 'UK', AT: 'AUSTRIA', BY: 'BELARUS', BE: 'BELGIUM', BG: 'BULGARIA', HR: 'CROATIA', DK: 'DENMARK', EE: 'ESTONIA',
    FI: 'FINLAND', FR: 'FRANCE', DE: 'GERMANY', GR: 'GREECE', HU: 'HUNGARY', IS: 'ICELAND', IE: 'IRELAND', IT: 'ITALY',
    LV: 'LATVIA', LT: 'LITHUANIA', LU: 'LUXEMBOURG', MC: 'MONACO', NL: 'NETHERLANDS', NO: 'NORWAY', PL: 'POLAND', PT: 'PORTUGAL',
    RO: 'ROMANIA', RU: 'RUSSIA', SK: 'SLOVAKIA', SI: 'SLOVENIA', ES: 'SPAIN', SE: 'SWEDEN', CH: 'SWITZERLAND', TR: 'TURKEY', UA: 'UKRAINE'

};
$(document).ready(function () {
    loadInfo();
    function saveInfo() {
        var userInfo = {};
        userInfo.name = $("#name").val();
        userInfo.email = $("#email").val();
        userInfo.tel = $("#tel").val();
        userInfo.street = $("#street").val();
        userInfo.street2 = $("#street2").val();
        userInfo.street3 = $("#street3").val();
        userInfo.zip = $("#zip").val();
        userInfo.city = $("#city").val();
        userInfo.c_num = $("#c_num").val();
        userInfo.cvv = $("#cvv").val();
        userInfo.exp_month = $("#exp_month").val();
        userInfo.exp_year = $("#exp_year").val();
        var uc = $("#u_country").val().toUpperCase();
        if (country[uc]) {
            userInfo.country = country[uc];
            console.log(userInfo.country);
        } else {
            alert("please check the country name");
        }
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
                $("#street3").val(userInfo.street3);
                $("#zip").val(userInfo.zip);
                $("#city").val(userInfo.city);
//                $("#state").val(userInfo.state);
                $("#u_country").val(mirrorCountry[userInfo.country]);
                var card = localStorage.card;
                $("li[value=" + card + "]").css("background-color", "red");
                $("#c_num").val(userInfo.c_num);
                $("#cvv").val(userInfo.cvv);
                $("#exp_month").val(userInfo.exp_month);
                $("#exp_year").val(userInfo.exp_year);
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
            if (card === "paypal") {
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
            localStorage.country = "";
            localStorage.card = "";
            storage.clear(function () {
            });
        }
    });

});