chrome.storage.local.get(["userInfo", "cl", "country", "card", "location", "shoeSize"], function (item) {
    var userInfo = item.userInfo;
    var if_auto = item.cl;
    var location = item.location;
    if (userInfo != null) {
        console.log("auto fill begin works");
//        info in common
        $('label:contains("email")').parent('div').find('input').val(userInfo.email);
        $('label:contains("tel")').parent('div').find('input').val(userInfo.tel);
        $('label:contains("address")').parent('div').find('input').val(userInfo.street);
        $('label:contains("zip")').parent('div').find('input').val(userInfo.zip);
        $('label:contains("post")').parent('div').find('input').val(userInfo.zip); //UK
        $('label:contains("city")').parent('div').find('input').val(userInfo.city);
        $("input[id*='terms']").attr('checked', 'checked');
        $('label:contains("type")').parent('div').find('select').val(item.card);
        $('label:contains("number")').parent('div').find('input').val(userInfo.c_num);
        $('label:contains("exp. date")').parent('div').find('select').eq(0).val(userInfo.exp_month);
        $('label:contains("exp. date")').parent('div').find('select').eq(1).val(userInfo.exp_year);
        $('label:contains("CVV")').parent('div').find('input').val(userInfo.cvv);
        var event = document.createEvent("UIEvents");
        event.initUIEvent("change", true, true);
//info different
        if (location.indexOf("Am") != -1) {
            //in case sometimes the change event can not be fire
            var country = item.country;
            var fc = "CANADA";
            if (country == fc) {
                fc = "USA";
            }
            var ct = $('label:contains("country")').parent('div').find('select');
            ct.val(fc);
            ct.val(country);
            document.getElementById("order_billing_country").dispatchEvent(event);
            $('label:contains("name")').parent('div').find('input').val(userInfo.name);
            $('label:contains("\xa0")').parent('div').find('input').val(userInfo.street2);
            document.getElementsByClassName("icheckbox_minimal")[1].className += " checked";
            $('label:contains("state")').parent('div').find('select').val(userInfo.state);
            $('label:contains("province")').parent('div').find('select').val(userInfo.state);


        } else if (location.indexOf("Ja") != -1) {

            $("select[id*='state']").val(" " + userInfo.state);
            $("input[id*='last']").val(userInfo.lName);
            $("input[id*='first']").val(userInfo.fName);
            document.getElementById("credit_card_type").dispatchEvent(event);


        } else if (location.indexOf("Eu") != -1) {
            $('label:contains("\xa0")').parent('div').find('input').eq(0).val(userInfo.street2);
            $('label:contains("\xa0")').parent('div').find('input').eq(1).val(userInfo.street3);
            $('label:contains("country")').parent('div').find('select').val(userInfo.country);
            $('label:contains("name")').parent('div').find('input').val(userInfo.name);
            document.getElementsByClassName("icheckbox_minimal")[1].className += " checked";

        }


    } else {
        console.log("auto fill con not work");
    }
    if (if_auto) {
        document.querySelectorAll("input.button.checkout")[0].click();
    }
});